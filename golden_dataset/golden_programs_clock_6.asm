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
LDI r14, 1
LDI r30, 0xFD00

; Init blink counter
LDI r20, BLINK
LDI r10, 0
STORE r20, r10

; =========================================
; MAIN LOOP
; =========================================
main_loop:
    LDI r14, 1

    ; Draw everything
    CALL render

    ; Signal frame
    FRAME

    ; Update blink toggle
    LDI r20, TICKS
    LOAD r4, r20
    LDI r10, 30
    DIV r4, r10
    LDI r10, 2
    MOD r4, r10
    LDI r20, BLINK
    STORE r20, r4

    JMP main_loop

; =========================================
; RENDER
; =========================================
render:
    PUSH r31
    LDI r14, 1

    ; ── Background ──
    LDI r10, 0x0A0A1E
    FILL r10

    ; ── Title bar ──
    LDI r14, 0
    LDI r10, 0
    LDI r15, 256
    LDI r1, 20
    LDI r9, 0x0D1B2A
    RECTF r14, r10, r15, r1, r9

    LDI r20, SCRATCH
    STRO r20, "GeoClock v1.0"
    LDI r10, 0
    STORE r20, r10
    LDI r14, 8
    LDI r10, 6
    LDI r15, SCRATCH
    TEXT r14, r10, r15

    ; ── Info panel (date/day) ──
    LDI r14, 0
    LDI r10, 20
    LDI r15, 256
    LDI r1, 20
    LDI r9, 0x101828
    RECTF r14, r10, r15, r1, r9

    ; Compute time values
    ; total_seconds = frame_count / 60
    LDI r20, TICKS
    LOAD r4, r20
    LDI r10, 60
    DIV r4, r10
    ; r4 = total_seconds

    ; hours = total_seconds / 3600
    LDI r7, 0
    ADD r7, r4
    LDI r10, 3600
    DIV r7, r10
    ; r7 = hours

    ; minutes = (total_seconds % 3600) / 60
    LDI r3, 0
    ADD r3, r4
    LDI r10, 3600
    MOD r3, r10
    LDI r10, 60
    DIV r3, r10
    ; r3 = minutes

    ; seconds = total_seconds % 60
    LDI r13, 0
    ADD r13, r4
    LDI r10, 60
    MOD r13, r10
    ; r13 = seconds

    ; days = hours / 24
    LDI r11, 0
    ADD r11, r7
    LDI r10, 24
    DIV r11, r10
    ; r11 = days

    ; hours within day = hours % 24
    LDI r7, 0
    ADD r7, r4
    LDI r10, 3600
    DIV r7, r10
    LDI r10, 24
    MOD r7, r10
    ; r7 = hours (0-23)

    ; Build "Day N  HH:MM:SS" string
    LDI r20, SCRATCH
    STRO r20, "Day "
    LDI r4, 0
    ADD r4, r11
    CALL write_number
    LDI r10, 32
    STORE r20, r10
    ADD r20, r14

    ; Write hours (2-digit with leading zero)
    CALL write_two_digit
    ; Colon
    LDI r20, BLINK
    LOAD r2, r20
    CMPI r2, 0
    JNZ r2, colon_on1
    LDI r10, 32
    STORE r20, r10
    ADD r20, r14
    LDI r10, 32
    STORE r20, r10
    ADD r20, r14
    JMP colon_done1
colon_on1:
    LDI r10, 58
    STORE r20, r10
    ADD r20, r14
    LDI r10, 58
    STORE r20, r10
    ADD r20, r14
colon_done1:

    ; Write minutes
    LDI r4, 0
    ADD r4, r3
    CALL write_two_digit
    ; Colon
    LDI r20, BLINK
    LOAD r2, r20
    CMPI r2, 0
    JNZ r2, colon_on2
    LDI r10, 32
    STORE r20, r10
    ADD r20, r14
    LDI r10, 32
    STORE r20, r10
    ADD r20, r14
    JMP colon_done2
colon_on2:
    LDI r10, 58
    STORE r20, r10
    ADD r20, r14
    LDI r10, 58
    STORE r20, r10
    ADD r20, r14
colon_done2:

    ; Write seconds
    LDI r4, 0
    ADD r4, r13
    CALL write_two_digit

    ; Null terminate
    LDI r10, 0
    STORE r20, r10

    ; Render time string at top of info panel
    LDI r14, 8
    LDI r10, 24
    LDI r15, SCRATCH
    TEXT r14, r10, r15

    ; ── Main clock panel ──
    LDI r14, 0
    LDI r10, 40
    LDI r15, 256
    LDI r1, 80
    LDI r9, 0x060612
    RECTF r14, r10, r15, r1, r9

    ; Large time display using TEXT at y=60
    ; Build "HH:MM:SS" string again for the large display
    LDI r20, SCRATCH
    LDI r4, 0
    ADD r4, r7
    CALL write_two_digit
    LDI r10, 58
    STORE r20, r10
    ADD r20, r14
    LDI r4, 0
    ADD r4, r3
    CALL write_two_digit
    LDI r10, 58
    STORE r20, r10
    ADD r20, r14
    LDI r4, 0
    ADD r4, r13
    CALL write_two_digit
    LDI r10, 0
    STORE r20, r10

    LDI r14, 80
    LDI r10, 65
    LDI r15, SCRATCH
    TEXT r14, r10, r15

    ; ── Statistics panel ──
    LDI r14, 0
    LDI r10, 120
    LDI r15, 256
    LDI r1, 60
    LDI r9, 0x0D0D1A
    RECTF r14, r10, r15, r1, r9

    ; Frame count
    LDI r20, SCRATCH
    STRO r20, "Frames: "
    LDI r20, TICKS
    LOAD r4, r20
    LDI r20, SCRATCH
    ADD r20, r14
    ADD r20, r14
    ADD r20, r14
    ADD r20, r14
    ADD r20, r14
    ADD r20, r14
    ADD r20, r14
    ADD r20, r14
    CALL write_number
    LDI r10, 0
    STORE r20, r10
    LDI r14, 8
    LDI r10, 126
    LDI r15, SCRATCH
    TEXT r14, r10, r15

    ; Total seconds
    LDI r20, SCRATCH
    STRO r20, "Seconds: "
    LDI r20, TICKS
    LOAD r4, r20
    LDI r10, 60
    DIV r4, r10
    LDI r20, SCRATCH
    ADD r20, r14
    ADD r20, r14
    ADD r20, r14
    ADD r20, r14
    ADD r20, r14
    ADD r20, r14
    ADD r20, r14
    ADD r20, r14
    ADD r20, r14
    CALL write_number
    LDI r10, 0
    STORE r20, r10
    LDI r14, 8
    LDI r10, 138
    LDI r15, SCRATCH
    TEXT r14, r10, r15

    ; Total minutes
    LDI r20, SCRATCH
    STRO r20, "Minutes: "
    LDI r20, TICKS
    LOAD r4, r20
    LDI r10, 3600
    DIV r4, r10
    LDI r20, SCRATCH
    ADD r20, r14
    ADD r20, r14
    ADD r20, r14
    ADD r20, r14
    ADD r20, r14
    ADD r20, r14
    ADD r20, r14
    ADD r20, r14
    ADD r20, r14
    CALL write_number
    LDI r10, 0
    STORE r20, r10
    LDI r14, 8
    LDI r10, 150
    LDI r15, SCRATCH
    TEXT r14, r10, r15

    ; Tick rate info
    LDI r20, SCRATCH
    STRO r20, "60 frames = 1 sim second"
    LDI r10, 0
    STORE r20, r10
    LDI r14, 8
    LDI r10, 164
    LDI r15, SCRATCH
    TEXT r14, r10, r15

    ; ── Large seconds display panel ──
    LDI r14, 0
    LDI r10, 180
    LDI r15, 256
    LDI r1, 56
    LDI r9, 0x060612
    RECTF r14, r10, r15, r1, r9

    ; Elapsed time string
    LDI r20, SCRATCH
    STRO r20, "Elapsed: "
    LDI r4, 0
    ADD r4, r11
    CALL write_number
    LDI r10, 32
    STORE r20, r10
    ADD r20, r14
    LDI r10, 100            ; 'd'
    STORE r20, r10
    ADD r20, r14
    LDI r10, 32
    STORE r20, r10
    ADD r20, r14
    LDI r4, 0
    ADD r4, r7
    CALL write_two_digit
    LDI r10, 58
    STORE r20, r10
    ADD r20, r14
    LDI r4, 0
    ADD r4, r3
    CALL write_two_digit
    LDI r10, 58
    STORE r20, r10
    ADD r20, r14
    LDI r4, 0
    ADD r4, r13
    CALL write_two_digit
    LDI r10, 0
    STORE r20, r10
    LDI r14, 8
    LDI r10, 195
    LDI r15, SCRATCH
    TEXT r14, r10, r15

    ; ── Status bar ──
    LDI r14, 0
    LDI r10, 240
    LDI r15, 256
    LDI r1, 16
    LDI r9, 0x0A0A1A
    RECTF r14, r10, r15, r1, r9

    LDI r20, SCRATCH
    STRO r20, "Geometry OS Clock"
    LDI r10, 0
    STORE r20, r10
    LDI r14, 8
    LDI r10, 244
    LDI r15, SCRATCH
    TEXT r14, r10, r15

    POP r31
    RET

; =========================================
; WRITE_TWO_DIGIT: Write value in r4 as 2-digit decimal at SCRATCH[r20]
; Advances r20 by 2
; Expects r14 = 1
; =========================================
write_two_digit:
    PUSH r31
    LDI r14, 1

    ; Tens digit
    LDI r2, 0
    ADD r2, r4
    LDI r10, 10
    DIV r2, r10
    LDI r10, 48
    ADD r10, r2
    STORE r20, r10
    ADD r20, r14

    ; Ones digit
    LDI r2, 0
    ADD r2, r4
    LDI r10, 10
    MOD r2, r10
    LDI r10, 48
    ADD r10, r2
    STORE r20, r10
    ADD r20, r14

    POP r31
    RET

; =========================================
; WRITE_NUMBER: Write number r4 as decimal at SCRATCH[r20]
; Advances r20 past the digits
; Expects r14 = 1
; =========================================
write_number:
    PUSH r31
    LDI r14, 1

    ; Handle 0
    CMPI r4, 0
    JNZ r4, wn_not_zero
    LDI r10, 48
    STORE r20, r10
    ADD r20, r14
    POP r31
    RET

wn_not_zero:
    ; Push digits onto stack (ones first), then pop (most significant first)
    LDI r5, 0
    ADD r5, r4          ; r5 = remaining value
    LDI r2, 0           ; digit count

wn_push_loop:
    CMPI r5, 0
    JZ r5, wn_pop_loop
    LDI r16, 0
    ADD r16, r5
    LDI r10, 10
    MOD r16, r10          ; r16 = ones digit
    PUSH r16
    ADD r2, r14
    LDI r10, 10
    DIV r5, r10
    JMP wn_push_loop

wn_pop_loop:
    CMPI r2, 0
    JZ r2, wn_done
    POP r16
    LDI r10, 48
    ADD r10, r16
    STORE r20, r10
    ADD r20, r14
    SUB r2, r14
    JMP wn_pop_loop

wn_done:
    POP r31
    RET
