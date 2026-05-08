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
LDI r3, 1
LDI r30, 0xFD00

; Init blink counter
LDI r20, BLINK
LDI r4, 0
STORE r20, r4

; =========================================
; MAIN LOOP
; =========================================
main_loop:
    LDI r3, 1

    ; Draw everything
    CALL render

    ; Signal frame
    FRAME

    ; Update blink toggle
    LDI r20, TICKS
    LOAD r13, r20
    LDI r4, 30
    DIV r13, r4
    LDI r4, 2
    MOD r13, r4
    LDI r20, BLINK
    STORE r20, r13

    JMP main_loop

; =========================================
; RENDER
; =========================================
render:
    PUSH r31
    LDI r3, 1

    ; ── Background ──
    LDI r4, 0x0A0A1E
    FILL r4

    ; ── Title bar ──
    LDI r3, 0
    LDI r4, 0
    LDI r14, 256
    LDI r6, 20
    LDI r11, 0x0D1B2A
    RECTF r3, r4, r14, r6, r11

    LDI r20, SCRATCH
    STRO r20, "GeoClock v1.0"
    LDI r4, 0
    STORE r20, r4
    LDI r3, 8
    LDI r4, 6
    LDI r14, SCRATCH
    TEXT r3, r4, r14

    ; ── Info panel (date/day) ──
    LDI r3, 0
    LDI r4, 20
    LDI r14, 256
    LDI r6, 20
    LDI r11, 0x101828
    RECTF r3, r4, r14, r6, r11

    ; Compute time values
    ; total_seconds = frame_count / 60
    LDI r20, TICKS
    LOAD r13, r20
    LDI r4, 60
    DIV r13, r4
    ; r13 = total_seconds

    ; hours = total_seconds / 3600
    LDI r0, 0
    ADD r0, r13
    LDI r4, 3600
    DIV r0, r4
    ; r0 = hours

    ; minutes = (total_seconds % 3600) / 60
    LDI r10, 0
    ADD r10, r13
    LDI r4, 3600
    MOD r10, r4
    LDI r4, 60
    DIV r10, r4
    ; r10 = minutes

    ; seconds = total_seconds % 60
    LDI r1, 0
    ADD r1, r13
    LDI r4, 60
    MOD r1, r4
    ; r1 = seconds

    ; days = hours / 24
    LDI r5, 0
    ADD r5, r0
    LDI r4, 24
    DIV r5, r4
    ; r5 = days

    ; hours within day = hours % 24
    LDI r0, 0
    ADD r0, r13
    LDI r4, 3600
    DIV r0, r4
    LDI r4, 24
    MOD r0, r4
    ; r0 = hours (0-23)

    ; Build "Day N  HH:MM:SS" string
    LDI r20, SCRATCH
    STRO r20, "Day "
    LDI r13, 0
    ADD r13, r5
    CALL write_number
    LDI r4, 32
    STORE r20, r4
    ADD r20, r3

    ; Write hours (2-digit with leading zero)
    CALL write_two_digit
    ; Colon
    LDI r20, BLINK
    LOAD r12, r20
    CMPI r12, 0
    JNZ r12, colon_on1
    LDI r4, 32
    STORE r20, r4
    ADD r20, r3
    LDI r4, 32
    STORE r20, r4
    ADD r20, r3
    JMP colon_done1
colon_on1:
    LDI r4, 58
    STORE r20, r4
    ADD r20, r3
    LDI r4, 58
    STORE r20, r4
    ADD r20, r3
colon_done1:

    ; Write minutes
    LDI r13, 0
    ADD r13, r10
    CALL write_two_digit
    ; Colon
    LDI r20, BLINK
    LOAD r12, r20
    CMPI r12, 0
    JNZ r12, colon_on2
    LDI r4, 32
    STORE r20, r4
    ADD r20, r3
    LDI r4, 32
    STORE r20, r4
    ADD r20, r3
    JMP colon_done2
colon_on2:
    LDI r4, 58
    STORE r20, r4
    ADD r20, r3
    LDI r4, 58
    STORE r20, r4
    ADD r20, r3
colon_done2:

    ; Write seconds
    LDI r13, 0
    ADD r13, r1
    CALL write_two_digit

    ; Null terminate
    LDI r4, 0
    STORE r20, r4

    ; Render time string at top of info panel
    LDI r3, 8
    LDI r4, 24
    LDI r14, SCRATCH
    TEXT r3, r4, r14

    ; ── Main clock panel ──
    LDI r3, 0
    LDI r4, 40
    LDI r14, 256
    LDI r6, 80
    LDI r11, 0x060612
    RECTF r3, r4, r14, r6, r11

    ; Large time display using TEXT at y=60
    ; Build "HH:MM:SS" string again for the large display
    LDI r20, SCRATCH
    LDI r13, 0
    ADD r13, r0
    CALL write_two_digit
    LDI r4, 58
    STORE r20, r4
    ADD r20, r3
    LDI r13, 0
    ADD r13, r10
    CALL write_two_digit
    LDI r4, 58
    STORE r20, r4
    ADD r20, r3
    LDI r13, 0
    ADD r13, r1
    CALL write_two_digit
    LDI r4, 0
    STORE r20, r4

    LDI r3, 80
    LDI r4, 65
    LDI r14, SCRATCH
    TEXT r3, r4, r14

    ; ── Statistics panel ──
    LDI r3, 0
    LDI r4, 120
    LDI r14, 256
    LDI r6, 60
    LDI r11, 0x0D0D1A
    RECTF r3, r4, r14, r6, r11

    ; Frame count
    LDI r20, SCRATCH
    STRO r20, "Frames: "
    LDI r20, TICKS
    LOAD r13, r20
    LDI r20, SCRATCH
    ADD r20, r3
    ADD r20, r3
    ADD r20, r3
    ADD r20, r3
    ADD r20, r3
    ADD r20, r3
    ADD r20, r3
    ADD r20, r3
    CALL write_number
    LDI r4, 0
    STORE r20, r4
    LDI r3, 8
    LDI r4, 126
    LDI r14, SCRATCH
    TEXT r3, r4, r14

    ; Total seconds
    LDI r20, SCRATCH
    STRO r20, "Seconds: "
    LDI r20, TICKS
    LOAD r13, r20
    LDI r4, 60
    DIV r13, r4
    LDI r20, SCRATCH
    ADD r20, r3
    ADD r20, r3
    ADD r20, r3
    ADD r20, r3
    ADD r20, r3
    ADD r20, r3
    ADD r20, r3
    ADD r20, r3
    ADD r20, r3
    CALL write_number
    LDI r4, 0
    STORE r20, r4
    LDI r3, 8
    LDI r4, 138
    LDI r14, SCRATCH
    TEXT r3, r4, r14

    ; Total minutes
    LDI r20, SCRATCH
    STRO r20, "Minutes: "
    LDI r20, TICKS
    LOAD r13, r20
    LDI r4, 3600
    DIV r13, r4
    LDI r20, SCRATCH
    ADD r20, r3
    ADD r20, r3
    ADD r20, r3
    ADD r20, r3
    ADD r20, r3
    ADD r20, r3
    ADD r20, r3
    ADD r20, r3
    ADD r20, r3
    CALL write_number
    LDI r4, 0
    STORE r20, r4
    LDI r3, 8
    LDI r4, 150
    LDI r14, SCRATCH
    TEXT r3, r4, r14

    ; Tick rate info
    LDI r20, SCRATCH
    STRO r20, "60 frames = 1 sim second"
    LDI r4, 0
    STORE r20, r4
    LDI r3, 8
    LDI r4, 164
    LDI r14, SCRATCH
    TEXT r3, r4, r14

    ; ── Large seconds display panel ──
    LDI r3, 0
    LDI r4, 180
    LDI r14, 256
    LDI r6, 56
    LDI r11, 0x060612
    RECTF r3, r4, r14, r6, r11

    ; Elapsed time string
    LDI r20, SCRATCH
    STRO r20, "Elapsed: "
    LDI r13, 0
    ADD r13, r5
    CALL write_number
    LDI r4, 32
    STORE r20, r4
    ADD r20, r3
    LDI r4, 100            ; 'd'
    STORE r20, r4
    ADD r20, r3
    LDI r4, 32
    STORE r20, r4
    ADD r20, r3
    LDI r13, 0
    ADD r13, r0
    CALL write_two_digit
    LDI r4, 58
    STORE r20, r4
    ADD r20, r3
    LDI r13, 0
    ADD r13, r10
    CALL write_two_digit
    LDI r4, 58
    STORE r20, r4
    ADD r20, r3
    LDI r13, 0
    ADD r13, r1
    CALL write_two_digit
    LDI r4, 0
    STORE r20, r4
    LDI r3, 8
    LDI r4, 195
    LDI r14, SCRATCH
    TEXT r3, r4, r14

    ; ── Status bar ──
    LDI r3, 0
    LDI r4, 240
    LDI r14, 256
    LDI r6, 16
    LDI r11, 0x0A0A1A
    RECTF r3, r4, r14, r6, r11

    LDI r20, SCRATCH
    STRO r20, "Geometry OS Clock"
    LDI r4, 0
    STORE r20, r4
    LDI r3, 8
    LDI r4, 244
    LDI r14, SCRATCH
    TEXT r3, r4, r14

    POP r31
    RET

; =========================================
; WRITE_TWO_DIGIT: Write value in r13 as 2-digit decimal at SCRATCH[r20]
; Advances r20 by 2
; Expects r3 = 1
; =========================================
write_two_digit:
    PUSH r31
    LDI r3, 1

    ; Tens digit
    LDI r12, 0
    ADD r12, r13
    LDI r4, 10
    DIV r12, r4
    LDI r4, 48
    ADD r4, r12
    STORE r20, r4
    ADD r20, r3

    ; Ones digit
    LDI r12, 0
    ADD r12, r13
    LDI r4, 10
    MOD r12, r4
    LDI r4, 48
    ADD r4, r12
    STORE r20, r4
    ADD r20, r3

    POP r31
    RET

; =========================================
; WRITE_NUMBER: Write number r13 as decimal at SCRATCH[r20]
; Advances r20 past the digits
; Expects r3 = 1
; =========================================
write_number:
    PUSH r31
    LDI r3, 1

    ; Handle 0
    CMPI r13, 0
    JNZ r13, wn_not_zero
    LDI r4, 48
    STORE r20, r4
    ADD r20, r3
    POP r31
    RET

wn_not_zero:
    ; Push digits onto stack (ones first), then pop (most significant first)
    LDI r15, 0
    ADD r15, r13          ; r15 = remaining value
    LDI r12, 0           ; digit count

wn_push_loop:
    CMPI r15, 0
    JZ r15, wn_pop_loop
    LDI r16, 0
    ADD r16, r15
    LDI r4, 10
    MOD r16, r4          ; r16 = ones digit
    PUSH r16
    ADD r12, r3
    LDI r4, 10
    DIV r15, r4
    JMP wn_push_loop

wn_pop_loop:
    CMPI r12, 0
    JZ r12, wn_done
    POP r16
    LDI r4, 48
    ADD r4, r16
    STORE r20, r4
    ADD r20, r3
    SUB r12, r3
    JMP wn_pop_loop

wn_done:
    POP r31
    RET
