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
LDI r9, 1
LDI r30, 0xFD00

; Init blink counter
LDI r20, BLINK
LDI r1, 0
STORE r20, r1

; =========================================
; MAIN LOOP
; =========================================
main_loop:
    LDI r9, 1

    ; Draw everything
    CALL render

    ; Signal frame
    FRAME

    ; Update blink toggle
    LDI r20, TICKS
    LOAD r13, r20
    LDI r1, 30
    DIV r13, r1
    LDI r1, 2
    MOD r13, r1
    LDI r20, BLINK
    STORE r20, r13

    JMP main_loop

; =========================================
; RENDER
; =========================================
render:
    PUSH r31
    LDI r9, 1

    ; ── Background ──
    LDI r1, 0x0A0A1E
    FILL r1

    ; ── Title bar ──
    LDI r9, 0
    LDI r1, 0
    LDI r8, 256
    LDI r3, 20
    LDI r5, 0x0D1B2A
    RECTF r9, r1, r8, r3, r5

    LDI r20, SCRATCH
    STRO r20, "GeoClock v1.0"
    LDI r1, 0
    STORE r20, r1
    LDI r9, 8
    LDI r1, 6
    LDI r8, SCRATCH
    TEXT r9, r1, r8

    ; ── Info panel (date/day) ──
    LDI r9, 0
    LDI r1, 20
    LDI r8, 256
    LDI r3, 20
    LDI r5, 0x101828
    RECTF r9, r1, r8, r3, r5

    ; Compute time values
    ; total_seconds = frame_count / 60
    LDI r20, TICKS
    LOAD r13, r20
    LDI r1, 60
    DIV r13, r1
    ; r13 = total_seconds

    ; hours = total_seconds / 3600
    LDI r14, 0
    ADD r14, r13
    LDI r1, 3600
    DIV r14, r1
    ; r14 = hours

    ; minutes = (total_seconds % 3600) / 60
    LDI r12, 0
    ADD r12, r13
    LDI r1, 3600
    MOD r12, r1
    LDI r1, 60
    DIV r12, r1
    ; r12 = minutes

    ; seconds = total_seconds % 60
    LDI r10, 0
    ADD r10, r13
    LDI r1, 60
    MOD r10, r1
    ; r10 = seconds

    ; days = hours / 24
    LDI r6, 0
    ADD r6, r14
    LDI r1, 24
    DIV r6, r1
    ; r6 = days

    ; hours within day = hours % 24
    LDI r14, 0
    ADD r14, r13
    LDI r1, 3600
    DIV r14, r1
    LDI r1, 24
    MOD r14, r1
    ; r14 = hours (0-23)

    ; Build "Day N  HH:MM:SS" string
    LDI r20, SCRATCH
    STRO r20, "Day "
    LDI r13, 0
    ADD r13, r6
    CALL write_number
    LDI r1, 32
    STORE r20, r1
    ADD r20, r9

    ; Write hours (2-digit with leading zero)
    CALL write_two_digit
    ; Colon
    LDI r20, BLINK
    LOAD r15, r20
    CMPI r15, 0
    JNZ r15, colon_on1
    LDI r1, 32
    STORE r20, r1
    ADD r20, r9
    LDI r1, 32
    STORE r20, r1
    ADD r20, r9
    JMP colon_done1
colon_on1:
    LDI r1, 58
    STORE r20, r1
    ADD r20, r9
    LDI r1, 58
    STORE r20, r1
    ADD r20, r9
colon_done1:

    ; Write minutes
    LDI r13, 0
    ADD r13, r12
    CALL write_two_digit
    ; Colon
    LDI r20, BLINK
    LOAD r15, r20
    CMPI r15, 0
    JNZ r15, colon_on2
    LDI r1, 32
    STORE r20, r1
    ADD r20, r9
    LDI r1, 32
    STORE r20, r1
    ADD r20, r9
    JMP colon_done2
colon_on2:
    LDI r1, 58
    STORE r20, r1
    ADD r20, r9
    LDI r1, 58
    STORE r20, r1
    ADD r20, r9
colon_done2:

    ; Write seconds
    LDI r13, 0
    ADD r13, r10
    CALL write_two_digit

    ; Null terminate
    LDI r1, 0
    STORE r20, r1

    ; Render time string at top of info panel
    LDI r9, 8
    LDI r1, 24
    LDI r8, SCRATCH
    TEXT r9, r1, r8

    ; ── Main clock panel ──
    LDI r9, 0
    LDI r1, 40
    LDI r8, 256
    LDI r3, 80
    LDI r5, 0x060612
    RECTF r9, r1, r8, r3, r5

    ; Large time display using TEXT at y=60
    ; Build "HH:MM:SS" string again for the large display
    LDI r20, SCRATCH
    LDI r13, 0
    ADD r13, r14
    CALL write_two_digit
    LDI r1, 58
    STORE r20, r1
    ADD r20, r9
    LDI r13, 0
    ADD r13, r12
    CALL write_two_digit
    LDI r1, 58
    STORE r20, r1
    ADD r20, r9
    LDI r13, 0
    ADD r13, r10
    CALL write_two_digit
    LDI r1, 0
    STORE r20, r1

    LDI r9, 80
    LDI r1, 65
    LDI r8, SCRATCH
    TEXT r9, r1, r8

    ; ── Statistics panel ──
    LDI r9, 0
    LDI r1, 120
    LDI r8, 256
    LDI r3, 60
    LDI r5, 0x0D0D1A
    RECTF r9, r1, r8, r3, r5

    ; Frame count
    LDI r20, SCRATCH
    STRO r20, "Frames: "
    LDI r20, TICKS
    LOAD r13, r20
    LDI r20, SCRATCH
    ADD r20, r9
    ADD r20, r9
    ADD r20, r9
    ADD r20, r9
    ADD r20, r9
    ADD r20, r9
    ADD r20, r9
    ADD r20, r9
    CALL write_number
    LDI r1, 0
    STORE r20, r1
    LDI r9, 8
    LDI r1, 126
    LDI r8, SCRATCH
    TEXT r9, r1, r8

    ; Total seconds
    LDI r20, SCRATCH
    STRO r20, "Seconds: "
    LDI r20, TICKS
    LOAD r13, r20
    LDI r1, 60
    DIV r13, r1
    LDI r20, SCRATCH
    ADD r20, r9
    ADD r20, r9
    ADD r20, r9
    ADD r20, r9
    ADD r20, r9
    ADD r20, r9
    ADD r20, r9
    ADD r20, r9
    ADD r20, r9
    CALL write_number
    LDI r1, 0
    STORE r20, r1
    LDI r9, 8
    LDI r1, 138
    LDI r8, SCRATCH
    TEXT r9, r1, r8

    ; Total minutes
    LDI r20, SCRATCH
    STRO r20, "Minutes: "
    LDI r20, TICKS
    LOAD r13, r20
    LDI r1, 3600
    DIV r13, r1
    LDI r20, SCRATCH
    ADD r20, r9
    ADD r20, r9
    ADD r20, r9
    ADD r20, r9
    ADD r20, r9
    ADD r20, r9
    ADD r20, r9
    ADD r20, r9
    ADD r20, r9
    CALL write_number
    LDI r1, 0
    STORE r20, r1
    LDI r9, 8
    LDI r1, 150
    LDI r8, SCRATCH
    TEXT r9, r1, r8

    ; Tick rate info
    LDI r20, SCRATCH
    STRO r20, "60 frames = 1 sim second"
    LDI r1, 0
    STORE r20, r1
    LDI r9, 8
    LDI r1, 164
    LDI r8, SCRATCH
    TEXT r9, r1, r8

    ; ── Large seconds display panel ──
    LDI r9, 0
    LDI r1, 180
    LDI r8, 256
    LDI r3, 56
    LDI r5, 0x060612
    RECTF r9, r1, r8, r3, r5

    ; Elapsed time string
    LDI r20, SCRATCH
    STRO r20, "Elapsed: "
    LDI r13, 0
    ADD r13, r6
    CALL write_number
    LDI r1, 32
    STORE r20, r1
    ADD r20, r9
    LDI r1, 100            ; 'd'
    STORE r20, r1
    ADD r20, r9
    LDI r1, 32
    STORE r20, r1
    ADD r20, r9
    LDI r13, 0
    ADD r13, r14
    CALL write_two_digit
    LDI r1, 58
    STORE r20, r1
    ADD r20, r9
    LDI r13, 0
    ADD r13, r12
    CALL write_two_digit
    LDI r1, 58
    STORE r20, r1
    ADD r20, r9
    LDI r13, 0
    ADD r13, r10
    CALL write_two_digit
    LDI r1, 0
    STORE r20, r1
    LDI r9, 8
    LDI r1, 195
    LDI r8, SCRATCH
    TEXT r9, r1, r8

    ; ── Status bar ──
    LDI r9, 0
    LDI r1, 240
    LDI r8, 256
    LDI r3, 16
    LDI r5, 0x0A0A1A
    RECTF r9, r1, r8, r3, r5

    LDI r20, SCRATCH
    STRO r20, "Geometry OS Clock"
    LDI r1, 0
    STORE r20, r1
    LDI r9, 8
    LDI r1, 244
    LDI r8, SCRATCH
    TEXT r9, r1, r8

    POP r31
    RET

; =========================================
; WRITE_TWO_DIGIT: Write value in r13 as 2-digit decimal at SCRATCH[r20]
; Advances r20 by 2
; Expects r9 = 1
; =========================================
write_two_digit:
    PUSH r31
    LDI r9, 1

    ; Tens digit
    LDI r15, 0
    ADD r15, r13
    LDI r1, 10
    DIV r15, r1
    LDI r1, 48
    ADD r1, r15
    STORE r20, r1
    ADD r20, r9

    ; Ones digit
    LDI r15, 0
    ADD r15, r13
    LDI r1, 10
    MOD r15, r1
    LDI r1, 48
    ADD r1, r15
    STORE r20, r1
    ADD r20, r9

    POP r31
    RET

; =========================================
; WRITE_NUMBER: Write number r13 as decimal at SCRATCH[r20]
; Advances r20 past the digits
; Expects r9 = 1
; =========================================
write_number:
    PUSH r31
    LDI r9, 1

    ; Handle 0
    CMPI r13, 0
    JNZ r13, wn_not_zero
    LDI r1, 48
    STORE r20, r1
    ADD r20, r9
    POP r31
    RET

wn_not_zero:
    ; Push digits onto stack (ones first), then pop (most significant first)
    LDI r11, 0
    ADD r11, r13          ; r11 = remaining value
    LDI r15, 0           ; digit count

wn_push_loop:
    CMPI r11, 0
    JZ r11, wn_pop_loop
    LDI r16, 0
    ADD r16, r11
    LDI r1, 10
    MOD r16, r1          ; r16 = ones digit
    PUSH r16
    ADD r15, r9
    LDI r1, 10
    DIV r11, r1
    JMP wn_push_loop

wn_pop_loop:
    CMPI r15, 0
    JZ r15, wn_done
    POP r16
    LDI r1, 48
    ADD r1, r16
    STORE r20, r1
    ADD r20, r9
    SUB r15, r9
    JMP wn_pop_loop

wn_done:
    POP r31
    RET
