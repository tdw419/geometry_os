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
LDI r15, 1
LDI r30, 0xFD00

; Init blink counter
LDI r20, BLINK
LDI r5, 0
STORE r20, r5

; =========================================
; MAIN LOOP
; =========================================
main_loop:
    LDI r15, 1

    ; Draw everything
    CALL render

    ; Signal frame
    FRAME

    ; Update blink toggle
    LDI r20, TICKS
    LOAD r4, r20
    LDI r5, 30
    DIV r4, r5
    LDI r5, 2
    MOD r4, r5
    LDI r20, BLINK
    STORE r20, r4

    JMP main_loop

; =========================================
; RENDER
; =========================================
render:
    PUSH r31
    LDI r15, 1

    ; ── Background ──
    LDI r5, 0x0A0A1E
    FILL r5

    ; ── Title bar ──
    LDI r15, 0
    LDI r5, 0
    LDI r3, 256
    LDI r8, 20
    LDI r12, 0x0D1B2A
    RECTF r15, r5, r3, r8, r12

    LDI r20, SCRATCH
    STRO r20, "GeoClock v1.0"
    LDI r5, 0
    STORE r20, r5
    LDI r15, 8
    LDI r5, 6
    LDI r3, SCRATCH
    TEXT r15, r5, r3

    ; ── Info panel (date/day) ──
    LDI r15, 0
    LDI r5, 20
    LDI r3, 256
    LDI r8, 20
    LDI r12, 0x101828
    RECTF r15, r5, r3, r8, r12

    ; Compute time values
    ; total_seconds = frame_count / 60
    LDI r20, TICKS
    LOAD r4, r20
    LDI r5, 60
    DIV r4, r5
    ; r4 = total_seconds

    ; hours = total_seconds / 3600
    LDI r13, 0
    ADD r13, r4
    LDI r5, 3600
    DIV r13, r5
    ; r13 = hours

    ; minutes = (total_seconds % 3600) / 60
    LDI r10, 0
    ADD r10, r4
    LDI r5, 3600
    MOD r10, r5
    LDI r5, 60
    DIV r10, r5
    ; r10 = minutes

    ; seconds = total_seconds % 60
    LDI r9, 0
    ADD r9, r4
    LDI r5, 60
    MOD r9, r5
    ; r9 = seconds

    ; days = hours / 24
    LDI r0, 0
    ADD r0, r13
    LDI r5, 24
    DIV r0, r5
    ; r0 = days

    ; hours within day = hours % 24
    LDI r13, 0
    ADD r13, r4
    LDI r5, 3600
    DIV r13, r5
    LDI r5, 24
    MOD r13, r5
    ; r13 = hours (0-23)

    ; Build "Day N  HH:MM:SS" string
    LDI r20, SCRATCH
    STRO r20, "Day "
    LDI r4, 0
    ADD r4, r0
    CALL write_number
    LDI r5, 32
    STORE r20, r5
    ADD r20, r15

    ; Write hours (2-digit with leading zero)
    CALL write_two_digit
    ; Colon
    LDI r20, BLINK
    LOAD r11, r20
    CMPI r11, 0
    JNZ r11, colon_on1
    LDI r5, 32
    STORE r20, r5
    ADD r20, r15
    LDI r5, 32
    STORE r20, r5
    ADD r20, r15
    JMP colon_done1
colon_on1:
    LDI r5, 58
    STORE r20, r5
    ADD r20, r15
    LDI r5, 58
    STORE r20, r5
    ADD r20, r15
colon_done1:

    ; Write minutes
    LDI r4, 0
    ADD r4, r10
    CALL write_two_digit
    ; Colon
    LDI r20, BLINK
    LOAD r11, r20
    CMPI r11, 0
    JNZ r11, colon_on2
    LDI r5, 32
    STORE r20, r5
    ADD r20, r15
    LDI r5, 32
    STORE r20, r5
    ADD r20, r15
    JMP colon_done2
colon_on2:
    LDI r5, 58
    STORE r20, r5
    ADD r20, r15
    LDI r5, 58
    STORE r20, r5
    ADD r20, r15
colon_done2:

    ; Write seconds
    LDI r4, 0
    ADD r4, r9
    CALL write_two_digit

    ; Null terminate
    LDI r5, 0
    STORE r20, r5

    ; Render time string at top of info panel
    LDI r15, 8
    LDI r5, 24
    LDI r3, SCRATCH
    TEXT r15, r5, r3

    ; ── Main clock panel ──
    LDI r15, 0
    LDI r5, 40
    LDI r3, 256
    LDI r8, 80
    LDI r12, 0x060612
    RECTF r15, r5, r3, r8, r12

    ; Large time display using TEXT at y=60
    ; Build "HH:MM:SS" string again for the large display
    LDI r20, SCRATCH
    LDI r4, 0
    ADD r4, r13
    CALL write_two_digit
    LDI r5, 58
    STORE r20, r5
    ADD r20, r15
    LDI r4, 0
    ADD r4, r10
    CALL write_two_digit
    LDI r5, 58
    STORE r20, r5
    ADD r20, r15
    LDI r4, 0
    ADD r4, r9
    CALL write_two_digit
    LDI r5, 0
    STORE r20, r5

    LDI r15, 80
    LDI r5, 65
    LDI r3, SCRATCH
    TEXT r15, r5, r3

    ; ── Statistics panel ──
    LDI r15, 0
    LDI r5, 120
    LDI r3, 256
    LDI r8, 60
    LDI r12, 0x0D0D1A
    RECTF r15, r5, r3, r8, r12

    ; Frame count
    LDI r20, SCRATCH
    STRO r20, "Frames: "
    LDI r20, TICKS
    LOAD r4, r20
    LDI r20, SCRATCH
    ADD r20, r15
    ADD r20, r15
    ADD r20, r15
    ADD r20, r15
    ADD r20, r15
    ADD r20, r15
    ADD r20, r15
    ADD r20, r15
    CALL write_number
    LDI r5, 0
    STORE r20, r5
    LDI r15, 8
    LDI r5, 126
    LDI r3, SCRATCH
    TEXT r15, r5, r3

    ; Total seconds
    LDI r20, SCRATCH
    STRO r20, "Seconds: "
    LDI r20, TICKS
    LOAD r4, r20
    LDI r5, 60
    DIV r4, r5
    LDI r20, SCRATCH
    ADD r20, r15
    ADD r20, r15
    ADD r20, r15
    ADD r20, r15
    ADD r20, r15
    ADD r20, r15
    ADD r20, r15
    ADD r20, r15
    ADD r20, r15
    CALL write_number
    LDI r5, 0
    STORE r20, r5
    LDI r15, 8
    LDI r5, 138
    LDI r3, SCRATCH
    TEXT r15, r5, r3

    ; Total minutes
    LDI r20, SCRATCH
    STRO r20, "Minutes: "
    LDI r20, TICKS
    LOAD r4, r20
    LDI r5, 3600
    DIV r4, r5
    LDI r20, SCRATCH
    ADD r20, r15
    ADD r20, r15
    ADD r20, r15
    ADD r20, r15
    ADD r20, r15
    ADD r20, r15
    ADD r20, r15
    ADD r20, r15
    ADD r20, r15
    CALL write_number
    LDI r5, 0
    STORE r20, r5
    LDI r15, 8
    LDI r5, 150
    LDI r3, SCRATCH
    TEXT r15, r5, r3

    ; Tick rate info
    LDI r20, SCRATCH
    STRO r20, "60 frames = 1 sim second"
    LDI r5, 0
    STORE r20, r5
    LDI r15, 8
    LDI r5, 164
    LDI r3, SCRATCH
    TEXT r15, r5, r3

    ; ── Large seconds display panel ──
    LDI r15, 0
    LDI r5, 180
    LDI r3, 256
    LDI r8, 56
    LDI r12, 0x060612
    RECTF r15, r5, r3, r8, r12

    ; Elapsed time string
    LDI r20, SCRATCH
    STRO r20, "Elapsed: "
    LDI r4, 0
    ADD r4, r0
    CALL write_number
    LDI r5, 32
    STORE r20, r5
    ADD r20, r15
    LDI r5, 100            ; 'd'
    STORE r20, r5
    ADD r20, r15
    LDI r5, 32
    STORE r20, r5
    ADD r20, r15
    LDI r4, 0
    ADD r4, r13
    CALL write_two_digit
    LDI r5, 58
    STORE r20, r5
    ADD r20, r15
    LDI r4, 0
    ADD r4, r10
    CALL write_two_digit
    LDI r5, 58
    STORE r20, r5
    ADD r20, r15
    LDI r4, 0
    ADD r4, r9
    CALL write_two_digit
    LDI r5, 0
    STORE r20, r5
    LDI r15, 8
    LDI r5, 195
    LDI r3, SCRATCH
    TEXT r15, r5, r3

    ; ── Status bar ──
    LDI r15, 0
    LDI r5, 240
    LDI r3, 256
    LDI r8, 16
    LDI r12, 0x0A0A1A
    RECTF r15, r5, r3, r8, r12

    LDI r20, SCRATCH
    STRO r20, "Geometry OS Clock"
    LDI r5, 0
    STORE r20, r5
    LDI r15, 8
    LDI r5, 244
    LDI r3, SCRATCH
    TEXT r15, r5, r3

    POP r31
    RET

; =========================================
; WRITE_TWO_DIGIT: Write value in r4 as 2-digit decimal at SCRATCH[r20]
; Advances r20 by 2
; Expects r15 = 1
; =========================================
write_two_digit:
    PUSH r31
    LDI r15, 1

    ; Tens digit
    LDI r11, 0
    ADD r11, r4
    LDI r5, 10
    DIV r11, r5
    LDI r5, 48
    ADD r5, r11
    STORE r20, r5
    ADD r20, r15

    ; Ones digit
    LDI r11, 0
    ADD r11, r4
    LDI r5, 10
    MOD r11, r5
    LDI r5, 48
    ADD r5, r11
    STORE r20, r5
    ADD r20, r15

    POP r31
    RET

; =========================================
; WRITE_NUMBER: Write number r4 as decimal at SCRATCH[r20]
; Advances r20 past the digits
; Expects r15 = 1
; =========================================
write_number:
    PUSH r31
    LDI r15, 1

    ; Handle 0
    CMPI r4, 0
    JNZ r4, wn_not_zero
    LDI r5, 48
    STORE r20, r5
    ADD r20, r15
    POP r31
    RET

wn_not_zero:
    ; Push digits onto stack (ones first), then pop (most significant first)
    LDI r6, 0
    ADD r6, r4          ; r6 = remaining value
    LDI r11, 0           ; digit count

wn_push_loop:
    CMPI r6, 0
    JZ r6, wn_pop_loop
    LDI r16, 0
    ADD r16, r6
    LDI r5, 10
    MOD r16, r5          ; r16 = ones digit
    PUSH r16
    ADD r11, r15
    LDI r5, 10
    DIV r6, r5
    JMP wn_push_loop

wn_pop_loop:
    CMPI r11, 0
    JZ r11, wn_done
    POP r16
    LDI r5, 48
    ADD r5, r16
    STORE r20, r5
    ADD r20, r15
    SUB r11, r15
    JMP wn_pop_loop

wn_done:
    POP r31
    RET
