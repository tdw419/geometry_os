; DESCRIPTION: Display a object using color colored at the screen.

; clock.asm -- Digital Clock App for Geometry OS
;
; Proves: FRAME (timing), TEXT (text rendering), RECTF (UI panels),
;         DIV/MOD (time math), LDI/LOAD/STORE (RAM state), STRO (strings).
;
; Features:
;   - Digital clock display (HH:MM:SS) derived from frame counter
;   - 60 frames = 1 simulated second
;   - Day counter from epoch
;   - Blinking colon separator
;   - Color-coded info panels
;   - Title bar and status info
;
; RAM Layout:
;   0x6000       blink toggle (0 or 1, flips each half-second)
;   0x6100-0x6140 scratch buffer for text rendering
;
; Screen Layout (256x256):
;   Row 0-19:     Title bar (dark navy 0x0D1B2A)
;   Row 20-39:    Date and day info panel (0x101828)
;   Row 40-119:   Main clock display (dark panel 0x060612)
;   Row 120-179:  Statistics panel (0x0D0D1A)
;   Row 180-239:  Large time display (dark panel 0x060612)
;   Row 240-255:  Status bar (0x0A0A1A)
;
; NOTE: No colons in comments (assembler pitfall)

#define BLINK   0x6000
#define TICKS   0xFFE
#define SCRATCH 0x6100

; =========================================
; INIT
; =========================================
LDI r7, 1
LDI r30, 0xFD00

; Init blink counter
LDI r20, BLINK
LDI r8, 0
STORE r20, r8

; =========================================
; MAIN LOOP
; =========================================
main_loop:
    LDI r7, 1

    ; Draw everything
    CALL render

    ; Signal frame
    FRAME

    ; Update blink toggle
    LDI r20, TICKS
    LOAD r9, r20
    LDI r8, 30
    DIV r9, r8
    LDI r8, 2
    MOD r9, r8
    LDI r20, BLINK
    STORE r20, r9

    JMP main_loop

; =========================================
; RENDER
; =========================================
render:
    PUSH r31
    LDI r7, 1

    ; ── Background ──
    LDI r8, 0x0A0A1E
    FILL r8

    ; ── Title bar ──
    LDI r7, 0
    LDI r8, 0
    LDI r6, 256
    LDI r14, 20
    LDI r10, 0x0D1B2A
    RECTF r7, r8, r6, r14, r10

    LDI r20, SCRATCH
    STRO r20, "GeoClock v1.0"
    LDI r8, 0
    STORE r20, r8
    LDI r7, 8
    LDI r8, 6
    LDI r6, SCRATCH
    TEXT r7, r8, r6

    ; ── Info panel (date/day) ──
    LDI r7, 0
    LDI r8, 20
    LDI r6, 256
    LDI r14, 20
    LDI r10, 0x101828
    RECTF r7, r8, r6, r14, r10

    ; Compute time values
    ; total_seconds = frame_count / 60
    LDI r20, TICKS
    LOAD r9, r20
    LDI r8, 60
    DIV r9, r8
    ; r9 = total_seconds

    ; hours = total_seconds / 3600
    LDI r2, 0
    ADD r2, r9
    LDI r8, 3600
    DIV r2, r8
    ; r2 = hours

    ; minutes = (total_seconds % 3600) / 60
    LDI r11, 0
    ADD r11, r9
    LDI r8, 3600
    MOD r11, r8
    LDI r8, 60
    DIV r11, r8
    ; r11 = minutes

    ; seconds = total_seconds % 60
    LDI r3, 0
    ADD r3, r9
    LDI r8, 60
    MOD r3, r8
    ; r3 = seconds

    ; days = hours / 24
    LDI r0, 0
    ADD r0, r2
    LDI r8, 24
    DIV r0, r8
    ; r0 = days

    ; hours within day = hours % 24
    LDI r2, 0
    ADD r2, r9
    LDI r8, 3600
    DIV r2, r8
    LDI r8, 24
    MOD r2, r8
    ; r2 = hours (0-23)

    ; Build "Day N  HH:MM:SS" string
    LDI r20, SCRATCH
    STRO r20, "Day "
    LDI r9, 0
    ADD r9, r0
    CALL write_number
    LDI r8, 32
    STORE r20, r8
    ADD r20, r7

    ; Write hours (2-digit with leading zero)
    CALL write_two_digit
    ; Colon
    LDI r20, BLINK
    LOAD r1, r20
    CMPI r1, 0
    JNZ r1, colon_on1
    LDI r8, 32
    STORE r20, r8
    ADD r20, r7
    LDI r8, 32
    STORE r20, r8
    ADD r20, r7
    JMP colon_done1
colon_on1:
    LDI r8, 58
    STORE r20, r8
    ADD r20, r7
    LDI r8, 58
    STORE r20, r8
    ADD r20, r7
colon_done1:

    ; Write minutes
    LDI r9, 0
    ADD r9, r11
    CALL write_two_digit
    ; Colon
    LDI r20, BLINK
    LOAD r1, r20
    CMPI r1, 0
    JNZ r1, colon_on2
    LDI r8, 32
    STORE r20, r8
    ADD r20, r7
    LDI r8, 32
    STORE r20, r8
    ADD r20, r7
    JMP colon_done2
colon_on2:
    LDI r8, 58
    STORE r20, r8
    ADD r20, r7
    LDI r8, 58
    STORE r20, r8
    ADD r20, r7
colon_done2:

    ; Write seconds
    LDI r9, 0
    ADD r9, r3
    CALL write_two_digit

    ; Null terminate
    LDI r8, 0
    STORE r20, r8

    ; Render time string at top of info panel
    LDI r7, 8
    LDI r8, 24
    LDI r6, SCRATCH
    TEXT r7, r8, r6

    ; ── Main clock panel ──
    LDI r7, 0
    LDI r8, 40
    LDI r6, 256
    LDI r14, 80
    LDI r10, 0x060612
    RECTF r7, r8, r6, r14, r10

    ; Large time display using TEXT at y=60
    ; Build "HH:MM:SS" string again for the large display
    LDI r20, SCRATCH
    LDI r9, 0
    ADD r9, r2
    CALL write_two_digit
    LDI r8, 58
    STORE r20, r8
    ADD r20, r7
    LDI r9, 0
    ADD r9, r11
    CALL write_two_digit
    LDI r8, 58
    STORE r20, r8
    ADD r20, r7
    LDI r9, 0
    ADD r9, r3
    CALL write_two_digit
    LDI r8, 0
    STORE r20, r8

    LDI r7, 80
    LDI r8, 65
    LDI r6, SCRATCH
    TEXT r7, r8, r6

    ; ── Statistics panel ──
    LDI r7, 0
    LDI r8, 120
    LDI r6, 256
    LDI r14, 60
    LDI r10, 0x0D0D1A
    RECTF r7, r8, r6, r14, r10

    ; Frame count
    LDI r20, SCRATCH
    STRO r20, "Frames: "
    LDI r20, TICKS
    LOAD r9, r20
    LDI r20, SCRATCH
    ADD r20, r7
    ADD r20, r7
    ADD r20, r7
    ADD r20, r7
    ADD r20, r7
    ADD r20, r7
    ADD r20, r7
    ADD r20, r7
    CALL write_number
    LDI r8, 0
    STORE r20, r8
    LDI r7, 8
    LDI r8, 126
    LDI r6, SCRATCH
    TEXT r7, r8, r6

    ; Total seconds
    LDI r20, SCRATCH
    STRO r20, "Seconds: "
    LDI r20, TICKS
    LOAD r9, r20
    LDI r8, 60
    DIV r9, r8
    LDI r20, SCRATCH
    ADD r20, r7
    ADD r20, r7
    ADD r20, r7
    ADD r20, r7
    ADD r20, r7
    ADD r20, r7
    ADD r20, r7
    ADD r20, r7
    ADD r20, r7
    CALL write_number
    LDI r8, 0
    STORE r20, r8
    LDI r7, 8
    LDI r8, 138
    LDI r6, SCRATCH
    TEXT r7, r8, r6

    ; Total minutes
    LDI r20, SCRATCH
    STRO r20, "Minutes: "
    LDI r20, TICKS
    LOAD r9, r20
    LDI r8, 3600
    DIV r9, r8
    LDI r20, SCRATCH
    ADD r20, r7
    ADD r20, r7
    ADD r20, r7
    ADD r20, r7
    ADD r20, r7
    ADD r20, r7
    ADD r20, r7
    ADD r20, r7
    ADD r20, r7
    CALL write_number
    LDI r8, 0
    STORE r20, r8
    LDI r7, 8
    LDI r8, 150
    LDI r6, SCRATCH
    TEXT r7, r8, r6

    ; Tick rate info
    LDI r20, SCRATCH
    STRO r20, "60 frames = 1 sim second"
    LDI r8, 0
    STORE r20, r8
    LDI r7, 8
    LDI r8, 164
    LDI r6, SCRATCH
    TEXT r7, r8, r6

    ; ── Large seconds display panel ──
    LDI r7, 0
    LDI r8, 180
    LDI r6, 256
    LDI r14, 56
    LDI r10, 0x060612
    RECTF r7, r8, r6, r14, r10

    ; Elapsed time string
    LDI r20, SCRATCH
    STRO r20, "Elapsed: "
    LDI r9, 0
    ADD r9, r0
    CALL write_number
    LDI r8, 32
    STORE r20, r8
    ADD r20, r7
    LDI r8, 100            ; 'd'
    STORE r20, r8
    ADD r20, r7
    LDI r8, 32
    STORE r20, r8
    ADD r20, r7
    LDI r9, 0
    ADD r9, r2
    CALL write_two_digit
    LDI r8, 58
    STORE r20, r8
    ADD r20, r7
    LDI r9, 0
    ADD r9, r11
    CALL write_two_digit
    LDI r8, 58
    STORE r20, r8
    ADD r20, r7
    LDI r9, 0
    ADD r9, r3
    CALL write_two_digit
    LDI r8, 0
    STORE r20, r8
    LDI r7, 8
    LDI r8, 195
    LDI r6, SCRATCH
    TEXT r7, r8, r6

    ; ── Status bar ──
    LDI r7, 0
    LDI r8, 240
    LDI r6, 256
    LDI r14, 16
    LDI r10, 0x0A0A1A
    RECTF r7, r8, r6, r14, r10

    LDI r20, SCRATCH
    STRO r20, "Geometry OS Clock"
    LDI r8, 0
    STORE r20, r8
    LDI r7, 8
    LDI r8, 244
    LDI r6, SCRATCH
    TEXT r7, r8, r6

    POP r31
    RET

; =========================================
; WRITE_TWO_DIGIT: Write value in r9 as 2-digit decimal at SCRATCH[r20]
; Advances r20 by 2
; Expects r7 = 1
; =========================================
write_two_digit:
    PUSH r31
    LDI r7, 1

    ; Tens digit
    LDI r1, 0
    ADD r1, r9
    LDI r8, 10
    DIV r1, r8
    LDI r8, 48
    ADD r8, r1
    STORE r20, r8
    ADD r20, r7

    ; Ones digit
    LDI r1, 0
    ADD r1, r9
    LDI r8, 10
    MOD r1, r8
    LDI r8, 48
    ADD r8, r1
    STORE r20, r8
    ADD r20, r7

    POP r31
    RET

; =========================================
; WRITE_NUMBER: Write number r9 as decimal at SCRATCH[r20]
; Advances r20 past the digits
; Expects r7 = 1
; =========================================
write_number:
    PUSH r31
    LDI r7, 1

    ; Handle 0
    CMPI r9, 0
    JNZ r9, wn_not_zero
    LDI r8, 48
    STORE r20, r8
    ADD r20, r7
    POP r31
    RET

wn_not_zero:
    ; Push digits onto stack (ones first), then pop (most significant first)
    LDI r15, 0
    ADD r15, r9          ; r15 = remaining value
    LDI r1, 0           ; digit count

wn_push_loop:
    CMPI r15, 0
    JZ r15, wn_pop_loop
    LDI r16, 0
    ADD r16, r15
    LDI r8, 10
    MOD r16, r8          ; r16 = ones digit
    PUSH r16
    ADD r1, r7
    LDI r8, 10
    DIV r15, r8
    JMP wn_push_loop

wn_pop_loop:
    CMPI r1, 0
    JZ r1, wn_done
    POP r16
    LDI r8, 48
    ADD r8, r16
    STORE r20, r8
    ADD r20, r7
    SUB r1, r7
    JMP wn_pop_loop

wn_done:
    POP r31
    RET
