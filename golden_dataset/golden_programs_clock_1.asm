; DESCRIPTION: Draws a colored object at the screen with fixed size.

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
LDI r11, 1
LDI r30, 0xFD00

; Init blink counter
LDI r20, BLINK
LDI r15, 0
STORE r20, r15

; =========================================
; MAIN LOOP
; =========================================
main_loop:
    LDI r11, 1

    ; Draw everything
    CALL render

    ; Signal frame
    FRAME

    ; Update blink toggle
    LDI r20, TICKS
    LOAD r6, r20
    LDI r15, 30
    DIV r6, r15
    LDI r15, 2
    MOD r6, r15
    LDI r20, BLINK
    STORE r20, r6

    JMP main_loop

; =========================================
; RENDER
; =========================================
render:
    PUSH r31
    LDI r11, 1

    ; ── Background ──
    LDI r15, 0x0A0A1E
    FILL r15

    ; ── Title bar ──
    LDI r11, 0
    LDI r15, 0
    LDI r9, 256
    LDI r8, 20
    LDI r7, 0x0D1B2A
    RECTF r11, r15, r9, r8, r7

    LDI r20, SCRATCH
    STRO r20, "GeoClock v1.0"
    LDI r15, 0
    STORE r20, r15
    LDI r11, 8
    LDI r15, 6
    LDI r9, SCRATCH
    TEXT r11, r15, r9

    ; ── Info panel (date/day) ──
    LDI r11, 0
    LDI r15, 20
    LDI r9, 256
    LDI r8, 20
    LDI r7, 0x101828
    RECTF r11, r15, r9, r8, r7

    ; Compute time values
    ; total_seconds = frame_count / 60
    LDI r20, TICKS
    LOAD r6, r20
    LDI r15, 60
    DIV r6, r15
    ; r6 = total_seconds

    ; hours = total_seconds / 3600
    LDI r2, 0
    ADD r2, r6
    LDI r15, 3600
    DIV r2, r15
    ; r2 = hours

    ; minutes = (total_seconds % 3600) / 60
    LDI r13, 0
    ADD r13, r6
    LDI r15, 3600
    MOD r13, r15
    LDI r15, 60
    DIV r13, r15
    ; r13 = minutes

    ; seconds = total_seconds % 60
    LDI r3, 0
    ADD r3, r6
    LDI r15, 60
    MOD r3, r15
    ; r3 = seconds

    ; days = hours / 24
    LDI r10, 0
    ADD r10, r2
    LDI r15, 24
    DIV r10, r15
    ; r10 = days

    ; hours within day = hours % 24
    LDI r2, 0
    ADD r2, r6
    LDI r15, 3600
    DIV r2, r15
    LDI r15, 24
    MOD r2, r15
    ; r2 = hours (0-23)

    ; Build "Day N  HH:MM:SS" string
    LDI r20, SCRATCH
    STRO r20, "Day "
    LDI r6, 0
    ADD r6, r10
    CALL write_number
    LDI r15, 32
    STORE r20, r15
    ADD r20, r11

    ; Write hours (2-digit with leading zero)
    CALL write_two_digit
    ; Colon
    LDI r20, BLINK
    LOAD r1, r20
    CMPI r1, 0
    JNZ r1, colon_on1
    LDI r15, 32
    STORE r20, r15
    ADD r20, r11
    LDI r15, 32
    STORE r20, r15
    ADD r20, r11
    JMP colon_done1
colon_on1:
    LDI r15, 58
    STORE r20, r15
    ADD r20, r11
    LDI r15, 58
    STORE r20, r15
    ADD r20, r11
colon_done1:

    ; Write minutes
    LDI r6, 0
    ADD r6, r13
    CALL write_two_digit
    ; Colon
    LDI r20, BLINK
    LOAD r1, r20
    CMPI r1, 0
    JNZ r1, colon_on2
    LDI r15, 32
    STORE r20, r15
    ADD r20, r11
    LDI r15, 32
    STORE r20, r15
    ADD r20, r11
    JMP colon_done2
colon_on2:
    LDI r15, 58
    STORE r20, r15
    ADD r20, r11
    LDI r15, 58
    STORE r20, r15
    ADD r20, r11
colon_done2:

    ; Write seconds
    LDI r6, 0
    ADD r6, r3
    CALL write_two_digit

    ; Null terminate
    LDI r15, 0
    STORE r20, r15

    ; Render time string at top of info panel
    LDI r11, 8
    LDI r15, 24
    LDI r9, SCRATCH
    TEXT r11, r15, r9

    ; ── Main clock panel ──
    LDI r11, 0
    LDI r15, 40
    LDI r9, 256
    LDI r8, 80
    LDI r7, 0x060612
    RECTF r11, r15, r9, r8, r7

    ; Large time display using TEXT at y=60
    ; Build "HH:MM:SS" string again for the large display
    LDI r20, SCRATCH
    LDI r6, 0
    ADD r6, r2
    CALL write_two_digit
    LDI r15, 58
    STORE r20, r15
    ADD r20, r11
    LDI r6, 0
    ADD r6, r13
    CALL write_two_digit
    LDI r15, 58
    STORE r20, r15
    ADD r20, r11
    LDI r6, 0
    ADD r6, r3
    CALL write_two_digit
    LDI r15, 0
    STORE r20, r15

    LDI r11, 80
    LDI r15, 65
    LDI r9, SCRATCH
    TEXT r11, r15, r9

    ; ── Statistics panel ──
    LDI r11, 0
    LDI r15, 120
    LDI r9, 256
    LDI r8, 60
    LDI r7, 0x0D0D1A
    RECTF r11, r15, r9, r8, r7

    ; Frame count
    LDI r20, SCRATCH
    STRO r20, "Frames: "
    LDI r20, TICKS
    LOAD r6, r20
    LDI r20, SCRATCH
    ADD r20, r11
    ADD r20, r11
    ADD r20, r11
    ADD r20, r11
    ADD r20, r11
    ADD r20, r11
    ADD r20, r11
    ADD r20, r11
    CALL write_number
    LDI r15, 0
    STORE r20, r15
    LDI r11, 8
    LDI r15, 126
    LDI r9, SCRATCH
    TEXT r11, r15, r9

    ; Total seconds
    LDI r20, SCRATCH
    STRO r20, "Seconds: "
    LDI r20, TICKS
    LOAD r6, r20
    LDI r15, 60
    DIV r6, r15
    LDI r20, SCRATCH
    ADD r20, r11
    ADD r20, r11
    ADD r20, r11
    ADD r20, r11
    ADD r20, r11
    ADD r20, r11
    ADD r20, r11
    ADD r20, r11
    ADD r20, r11
    CALL write_number
    LDI r15, 0
    STORE r20, r15
    LDI r11, 8
    LDI r15, 138
    LDI r9, SCRATCH
    TEXT r11, r15, r9

    ; Total minutes
    LDI r20, SCRATCH
    STRO r20, "Minutes: "
    LDI r20, TICKS
    LOAD r6, r20
    LDI r15, 3600
    DIV r6, r15
    LDI r20, SCRATCH
    ADD r20, r11
    ADD r20, r11
    ADD r20, r11
    ADD r20, r11
    ADD r20, r11
    ADD r20, r11
    ADD r20, r11
    ADD r20, r11
    ADD r20, r11
    CALL write_number
    LDI r15, 0
    STORE r20, r15
    LDI r11, 8
    LDI r15, 150
    LDI r9, SCRATCH
    TEXT r11, r15, r9

    ; Tick rate info
    LDI r20, SCRATCH
    STRO r20, "60 frames = 1 sim second"
    LDI r15, 0
    STORE r20, r15
    LDI r11, 8
    LDI r15, 164
    LDI r9, SCRATCH
    TEXT r11, r15, r9

    ; ── Large seconds display panel ──
    LDI r11, 0
    LDI r15, 180
    LDI r9, 256
    LDI r8, 56
    LDI r7, 0x060612
    RECTF r11, r15, r9, r8, r7

    ; Elapsed time string
    LDI r20, SCRATCH
    STRO r20, "Elapsed: "
    LDI r6, 0
    ADD r6, r10
    CALL write_number
    LDI r15, 32
    STORE r20, r15
    ADD r20, r11
    LDI r15, 100            ; 'd'
    STORE r20, r15
    ADD r20, r11
    LDI r15, 32
    STORE r20, r15
    ADD r20, r11
    LDI r6, 0
    ADD r6, r2
    CALL write_two_digit
    LDI r15, 58
    STORE r20, r15
    ADD r20, r11
    LDI r6, 0
    ADD r6, r13
    CALL write_two_digit
    LDI r15, 58
    STORE r20, r15
    ADD r20, r11
    LDI r6, 0
    ADD r6, r3
    CALL write_two_digit
    LDI r15, 0
    STORE r20, r15
    LDI r11, 8
    LDI r15, 195
    LDI r9, SCRATCH
    TEXT r11, r15, r9

    ; ── Status bar ──
    LDI r11, 0
    LDI r15, 240
    LDI r9, 256
    LDI r8, 16
    LDI r7, 0x0A0A1A
    RECTF r11, r15, r9, r8, r7

    LDI r20, SCRATCH
    STRO r20, "Geometry OS Clock"
    LDI r15, 0
    STORE r20, r15
    LDI r11, 8
    LDI r15, 244
    LDI r9, SCRATCH
    TEXT r11, r15, r9

    POP r31
    RET

; =========================================
; WRITE_TWO_DIGIT: Write value in r6 as 2-digit decimal at SCRATCH[r20]
; Advances r20 by 2
; Expects r11 = 1
; =========================================
write_two_digit:
    PUSH r31
    LDI r11, 1

    ; Tens digit
    LDI r1, 0
    ADD r1, r6
    LDI r15, 10
    DIV r1, r15
    LDI r15, 48
    ADD r15, r1
    STORE r20, r15
    ADD r20, r11

    ; Ones digit
    LDI r1, 0
    ADD r1, r6
    LDI r15, 10
    MOD r1, r15
    LDI r15, 48
    ADD r15, r1
    STORE r20, r15
    ADD r20, r11

    POP r31
    RET

; =========================================
; WRITE_NUMBER: Write number r6 as decimal at SCRATCH[r20]
; Advances r20 past the digits
; Expects r11 = 1
; =========================================
write_number:
    PUSH r31
    LDI r11, 1

    ; Handle 0
    CMPI r6, 0
    JNZ r6, wn_not_zero
    LDI r15, 48
    STORE r20, r15
    ADD r20, r11
    POP r31
    RET

wn_not_zero:
    ; Push digits onto stack (ones first), then pop (most significant first)
    LDI r4, 0
    ADD r4, r6          ; r4 = remaining value
    LDI r1, 0           ; digit count

wn_push_loop:
    CMPI r4, 0
    JZ r4, wn_pop_loop
    LDI r16, 0
    ADD r16, r4
    LDI r15, 10
    MOD r16, r15          ; r16 = ones digit
    PUSH r16
    ADD r1, r11
    LDI r15, 10
    DIV r4, r15
    JMP wn_push_loop

wn_pop_loop:
    CMPI r1, 0
    JZ r1, wn_done
    POP r16
    LDI r15, 48
    ADD r15, r16
    STORE r20, r15
    ADD r20, r11
    SUB r1, r11
    JMP wn_pop_loop

wn_done:
    POP r31
    RET
