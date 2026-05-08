; DESCRIPTION: This GeOS assembly code implements a digital clock application with features such as a blinking colon separator, color-coded info panels, and displays for day counter, elapsed time, and frame statistics. It uses the FRAME instruction to manage timing and updates the display every 60 frames to simulate one second. The code also includes functions to render text and handle number formatting for displaying time values accurately.

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
LDI r13, 1
LDI r30, 0xFD00

; Init blink counter
LDI r20, BLINK
LDI r3, 0
STORE r20, r3

; =========================================
; MAIN LOOP
; =========================================
main_loop:
    LDI r13, 1

    ; Draw everything
    CALL render

    ; Signal frame
    FRAME

    ; Update blink toggle
    LDI r20, TICKS
    LOAD r1, r20
    LDI r3, 30
    DIV r1, r3
    LDI r3, 2
    MOD r1, r3
    LDI r20, BLINK
    STORE r20, r1

    JMP main_loop

; =========================================
; RENDER
; =========================================
render:
    PUSH r31
    LDI r13, 1

    ; ── Background ──
    LDI r3, 0x0A0A1E
    FILL r3

    ; ── Title bar ──
    LDI r13, 0
    LDI r3, 0
    LDI r2, 256
    LDI r6, 20
    LDI r5, 0x0D1B2A
    RECTF r13, r3, r2, r6, r5

    LDI r20, SCRATCH
    STRO r20, "GeoClock v1.0"
    LDI r3, 0
    STORE r20, r3
    LDI r13, 8
    LDI r3, 6
    LDI r2, SCRATCH
    TEXT r13, r3, r2

    ; ── Info panel (date/day) ──
    LDI r13, 0
    LDI r3, 20
    LDI r2, 256
    LDI r6, 20
    LDI r5, 0x101828
    RECTF r13, r3, r2, r6, r5

    ; Compute time values
    ; total_seconds = frame_count / 60
    LDI r20, TICKS
    LOAD r1, r20
    LDI r3, 60
    DIV r1, r3
    ; r1 = total_seconds

    ; hours = total_seconds / 3600
    LDI r15, 0
    ADD r15, r1
    LDI r3, 3600
    DIV r15, r3
    ; r15 = hours

    ; minutes = (total_seconds % 3600) / 60
    LDI r11, 0
    ADD r11, r1
    LDI r3, 3600
    MOD r11, r3
    LDI r3, 60
    DIV r11, r3
    ; r11 = minutes

    ; seconds = total_seconds % 60
    LDI r4, 0
    ADD r4, r1
    LDI r3, 60
    MOD r4, r3
    ; r4 = seconds

    ; days = hours / 24
    LDI r0, 0
    ADD r0, r15
    LDI r3, 24
    DIV r0, r3
    ; r0 = days

    ; hours within day = hours % 24
    LDI r15, 0
    ADD r15, r1
    LDI r3, 3600
    DIV r15, r3
    LDI r3, 24
    MOD r15, r3
    ; r15 = hours (0-23)

    ; Build "Day N  HH:MM:SS" string
    LDI r20, SCRATCH
    STRO r20, "Day "
    LDI r1, 0
    ADD r1, r0
    CALL write_number
    LDI r3, 32
    STORE r20, r3
    ADD r20, r13

    ; Write hours (2-digit with leading zero)
    CALL write_two_digit
    ; Colon
    LDI r20, BLINK
    LOAD r12, r20
    CMPI r12, 0
    JNZ r12, colon_on1
    LDI r3, 32
    STORE r20, r3
    ADD r20, r13
    LDI r3, 32
    STORE r20, r3
    ADD r20, r13
    JMP colon_done1
colon_on1:
    LDI r3, 58
    STORE r20, r3
    ADD r20, r13
    LDI r3, 58
    STORE r20, r3
    ADD r20, r13
colon_done1:

    ; Write minutes
    LDI r1, 0
    ADD r1, r11
    CALL write_two_digit
    ; Colon
    LDI r20, BLINK
    LOAD r12, r20
    CMPI r12, 0
    JNZ r12, colon_on2
    LDI r3, 32
    STORE r20, r3
    ADD r20, r13
    LDI r3, 32
    STORE r20, r3
    ADD r20, r13
    JMP colon_done2
colon_on2:
    LDI r3, 58
    STORE r20, r3
    ADD r20, r13
    LDI r3, 58
    STORE r20, r3
    ADD r20, r13
colon_done2:

    ; Write seconds
    LDI r1, 0
    ADD r1, r4
    CALL write_two_digit

    ; Null terminate
    LDI r3, 0
    STORE r20, r3

    ; Render time string at top of info panel
    LDI r13, 8
    LDI r3, 24
    LDI r2, SCRATCH
    TEXT r13, r3, r2

    ; ── Main clock panel ──
    LDI r13, 0
    LDI r3, 40
    LDI r2, 256
    LDI r6, 80
    LDI r5, 0x060612
    RECTF r13, r3, r2, r6, r5

    ; Large time display using TEXT at y=60
    ; Build "HH:MM:SS" string again for the large display
    LDI r20, SCRATCH
    LDI r1, 0
    ADD r1, r15
    CALL write_two_digit
    LDI r3, 58
    STORE r20, r3
    ADD r20, r13
    LDI r1, 0
    ADD r1, r11
    CALL write_two_digit
    LDI r3, 58
    STORE r20, r3
    ADD r20, r13
    LDI r1, 0
    ADD r1, r4
    CALL write_two_digit
    LDI r3, 0
    STORE r20, r3

    LDI r13, 80
    LDI r3, 65
    LDI r2, SCRATCH
    TEXT r13, r3, r2

    ; ── Statistics panel ──
    LDI r13, 0
    LDI r3, 120
    LDI r2, 256
    LDI r6, 60
    LDI r5, 0x0D0D1A
    RECTF r13, r3, r2, r6, r5

    ; Frame count
    LDI r20, SCRATCH
    STRO r20, "Frames: "
    LDI r20, TICKS
    LOAD r1, r20
    LDI r20, SCRATCH
    ADD r20, r13
    ADD r20, r13
    ADD r20, r13
    ADD r20, r13
    ADD r20, r13
    ADD r20, r13
    ADD r20, r13
    ADD r20, r13
    CALL write_number
    LDI r3, 0
    STORE r20, r3
    LDI r13, 8
    LDI r3, 126
    LDI r2, SCRATCH
    TEXT r13, r3, r2

    ; Total seconds
    LDI r20, SCRATCH
    STRO r20, "Seconds: "
    LDI r20, TICKS
    LOAD r1, r20
    LDI r3, 60
    DIV r1, r3
    LDI r20, SCRATCH
    ADD r20, r13
    ADD r20, r13
    ADD r20, r13
    ADD r20, r13
    ADD r20, r13
    ADD r20, r13
    ADD r20, r13
    ADD r20, r13
    ADD r20, r13
    CALL write_number
    LDI r3, 0
    STORE r20, r3
    LDI r13, 8
    LDI r3, 138
    LDI r2, SCRATCH
    TEXT r13, r3, r2

    ; Total minutes
    LDI r20, SCRATCH
    STRO r20, "Minutes: "
    LDI r20, TICKS
    LOAD r1, r20
    LDI r3, 3600
    DIV r1, r3
    LDI r20, SCRATCH
    ADD r20, r13
    ADD r20, r13
    ADD r20, r13
    ADD r20, r13
    ADD r20, r13
    ADD r20, r13
    ADD r20, r13
    ADD r20, r13
    ADD r20, r13
    CALL write_number
    LDI r3, 0
    STORE r20, r3
    LDI r13, 8
    LDI r3, 150
    LDI r2, SCRATCH
    TEXT r13, r3, r2

    ; Tick rate info
    LDI r20, SCRATCH
    STRO r20, "60 frames = 1 sim second"
    LDI r3, 0
    STORE r20, r3
    LDI r13, 8
    LDI r3, 164
    LDI r2, SCRATCH
    TEXT r13, r3, r2

    ; ── Large seconds display panel ──
    LDI r13, 0
    LDI r3, 180
    LDI r2, 256
    LDI r6, 56
    LDI r5, 0x060612
    RECTF r13, r3, r2, r6, r5

    ; Elapsed time string
    LDI r20, SCRATCH
    STRO r20, "Elapsed: "
    LDI r1, 0
    ADD r1, r0
    CALL write_number
    LDI r3, 32
    STORE r20, r3
    ADD r20, r13
    LDI r3, 100            ; 'd'
    STORE r20, r3
    ADD r20, r13
    LDI r3, 32
    STORE r20, r3
    ADD r20, r13
    LDI r1, 0
    ADD r1, r15
    CALL write_two_digit
    LDI r3, 58
    STORE r20, r3
    ADD r20, r13
    LDI r1, 0
    ADD r1, r11
    CALL write_two_digit
    LDI r3, 58
    STORE r20, r3
    ADD r20, r13
    LDI r1, 0
    ADD r1, r4
    CALL write_two_digit
    LDI r3, 0
    STORE r20, r3
    LDI r13, 8
    LDI r3, 195
    LDI r2, SCRATCH
    TEXT r13, r3, r2

    ; ── Status bar ──
    LDI r13, 0
    LDI r3, 240
    LDI r2, 256
    LDI r6, 16
    LDI r5, 0x0A0A1A
    RECTF r13, r3, r2, r6, r5

    LDI r20, SCRATCH
    STRO r20, "Geometry OS Clock"
    LDI r3, 0
    STORE r20, r3
    LDI r13, 8
    LDI r3, 244
    LDI r2, SCRATCH
    TEXT r13, r3, r2

    POP r31
    RET

; =========================================
; WRITE_TWO_DIGIT: Write value in r1 as 2-digit decimal at SCRATCH[r20]
; Advances r20 by 2
; Expects r13 = 1
; =========================================
write_two_digit:
    PUSH r31
    LDI r13, 1

    ; Tens digit
    LDI r12, 0
    ADD r12, r1
    LDI r3, 10
    DIV r12, r3
    LDI r3, 48
    ADD r3, r12
    STORE r20, r3
    ADD r20, r13

    ; Ones digit
    LDI r12, 0
    ADD r12, r1
    LDI r3, 10
    MOD r12, r3
    LDI r3, 48
    ADD r3, r12
    STORE r20, r3
    ADD r20, r13

    POP r31
    RET

; =========================================
; WRITE_NUMBER: Write number r1 as decimal at SCRATCH[r20]
; Advances r20 past the digits
; Expects r13 = 1
; =========================================
write_number:
    PUSH r31
    LDI r13, 1

    ; Handle 0
    CMPI r1, 0
    JNZ r1, wn_not_zero
    LDI r3, 48
    STORE r20, r3
    ADD r20, r13
    POP r31
    RET

wn_not_zero:
    ; Push digits onto stack (ones first), then pop (most significant first)
    LDI r10, 0
    ADD r10, r1          ; r10 = remaining value
    LDI r12, 0           ; digit count

wn_push_loop:
    CMPI r10, 0
    JZ r10, wn_pop_loop
    LDI r16, 0
    ADD r16, r10
    LDI r3, 10
    MOD r16, r3          ; r16 = ones digit
    PUSH r16
    ADD r12, r13
    LDI r3, 10
    DIV r10, r3
    JMP wn_push_loop

wn_pop_loop:
    CMPI r12, 0
    JZ r12, wn_done
    POP r16
    LDI r3, 48
    ADD r3, r16
    STORE r20, r3
    ADD r20, r13
    SUB r12, r13
    JMP wn_pop_loop

wn_done:
    POP r31
    RET
