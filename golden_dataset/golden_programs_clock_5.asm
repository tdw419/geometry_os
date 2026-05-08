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
LDI r0, 1
LDI r30, 0xFD00

; Init blink counter
LDI r20, BLINK
LDI r1, 0
STORE r20, r1

; =========================================
; MAIN LOOP
; =========================================
main_loop:
    LDI r0, 1

    ; Draw everything
    CALL render

    ; Signal frame
    FRAME

    ; Update blink toggle
    LDI r20, TICKS
    LOAD r6, r20
    LDI r1, 30
    DIV r6, r1
    LDI r1, 2
    MOD r6, r1
    LDI r20, BLINK
    STORE r20, r6

    JMP main_loop

; =========================================
; RENDER
; =========================================
render:
    PUSH r31
    LDI r0, 1

    ; ── Background ──
    LDI r1, 0x0A0A1E
    FILL r1

    ; ── Title bar ──
    LDI r0, 0
    LDI r1, 0
    LDI r15, 256
    LDI r11, 20
    LDI r2, 0x0D1B2A
    RECTF r0, r1, r15, r11, r2

    LDI r20, SCRATCH
    STRO r20, "GeoClock v1.0"
    LDI r1, 0
    STORE r20, r1
    LDI r0, 8
    LDI r1, 6
    LDI r15, SCRATCH
    TEXT r0, r1, r15

    ; ── Info panel (date/day) ──
    LDI r0, 0
    LDI r1, 20
    LDI r15, 256
    LDI r11, 20
    LDI r2, 0x101828
    RECTF r0, r1, r15, r11, r2

    ; Compute time values
    ; total_seconds = frame_count / 60
    LDI r20, TICKS
    LOAD r6, r20
    LDI r1, 60
    DIV r6, r1
    ; r6 = total_seconds

    ; hours = total_seconds / 3600
    LDI r8, 0
    ADD r8, r6
    LDI r1, 3600
    DIV r8, r1
    ; r8 = hours

    ; minutes = (total_seconds % 3600) / 60
    LDI r13, 0
    ADD r13, r6
    LDI r1, 3600
    MOD r13, r1
    LDI r1, 60
    DIV r13, r1
    ; r13 = minutes

    ; seconds = total_seconds % 60
    LDI r5, 0
    ADD r5, r6
    LDI r1, 60
    MOD r5, r1
    ; r5 = seconds

    ; days = hours / 24
    LDI r12, 0
    ADD r12, r8
    LDI r1, 24
    DIV r12, r1
    ; r12 = days

    ; hours within day = hours % 24
    LDI r8, 0
    ADD r8, r6
    LDI r1, 3600
    DIV r8, r1
    LDI r1, 24
    MOD r8, r1
    ; r8 = hours (0-23)

    ; Build "Day N  HH:MM:SS" string
    LDI r20, SCRATCH
    STRO r20, "Day "
    LDI r6, 0
    ADD r6, r12
    CALL write_number
    LDI r1, 32
    STORE r20, r1
    ADD r20, r0

    ; Write hours (2-digit with leading zero)
    CALL write_two_digit
    ; Colon
    LDI r20, BLINK
    LOAD r9, r20
    CMPI r9, 0
    JNZ r9, colon_on1
    LDI r1, 32
    STORE r20, r1
    ADD r20, r0
    LDI r1, 32
    STORE r20, r1
    ADD r20, r0
    JMP colon_done1
colon_on1:
    LDI r1, 58
    STORE r20, r1
    ADD r20, r0
    LDI r1, 58
    STORE r20, r1
    ADD r20, r0
colon_done1:

    ; Write minutes
    LDI r6, 0
    ADD r6, r13
    CALL write_two_digit
    ; Colon
    LDI r20, BLINK
    LOAD r9, r20
    CMPI r9, 0
    JNZ r9, colon_on2
    LDI r1, 32
    STORE r20, r1
    ADD r20, r0
    LDI r1, 32
    STORE r20, r1
    ADD r20, r0
    JMP colon_done2
colon_on2:
    LDI r1, 58
    STORE r20, r1
    ADD r20, r0
    LDI r1, 58
    STORE r20, r1
    ADD r20, r0
colon_done2:

    ; Write seconds
    LDI r6, 0
    ADD r6, r5
    CALL write_two_digit

    ; Null terminate
    LDI r1, 0
    STORE r20, r1

    ; Render time string at top of info panel
    LDI r0, 8
    LDI r1, 24
    LDI r15, SCRATCH
    TEXT r0, r1, r15

    ; ── Main clock panel ──
    LDI r0, 0
    LDI r1, 40
    LDI r15, 256
    LDI r11, 80
    LDI r2, 0x060612
    RECTF r0, r1, r15, r11, r2

    ; Large time display using TEXT at y=60
    ; Build "HH:MM:SS" string again for the large display
    LDI r20, SCRATCH
    LDI r6, 0
    ADD r6, r8
    CALL write_two_digit
    LDI r1, 58
    STORE r20, r1
    ADD r20, r0
    LDI r6, 0
    ADD r6, r13
    CALL write_two_digit
    LDI r1, 58
    STORE r20, r1
    ADD r20, r0
    LDI r6, 0
    ADD r6, r5
    CALL write_two_digit
    LDI r1, 0
    STORE r20, r1

    LDI r0, 80
    LDI r1, 65
    LDI r15, SCRATCH
    TEXT r0, r1, r15

    ; ── Statistics panel ──
    LDI r0, 0
    LDI r1, 120
    LDI r15, 256
    LDI r11, 60
    LDI r2, 0x0D0D1A
    RECTF r0, r1, r15, r11, r2

    ; Frame count
    LDI r20, SCRATCH
    STRO r20, "Frames: "
    LDI r20, TICKS
    LOAD r6, r20
    LDI r20, SCRATCH
    ADD r20, r0
    ADD r20, r0
    ADD r20, r0
    ADD r20, r0
    ADD r20, r0
    ADD r20, r0
    ADD r20, r0
    ADD r20, r0
    CALL write_number
    LDI r1, 0
    STORE r20, r1
    LDI r0, 8
    LDI r1, 126
    LDI r15, SCRATCH
    TEXT r0, r1, r15

    ; Total seconds
    LDI r20, SCRATCH
    STRO r20, "Seconds: "
    LDI r20, TICKS
    LOAD r6, r20
    LDI r1, 60
    DIV r6, r1
    LDI r20, SCRATCH
    ADD r20, r0
    ADD r20, r0
    ADD r20, r0
    ADD r20, r0
    ADD r20, r0
    ADD r20, r0
    ADD r20, r0
    ADD r20, r0
    ADD r20, r0
    CALL write_number
    LDI r1, 0
    STORE r20, r1
    LDI r0, 8
    LDI r1, 138
    LDI r15, SCRATCH
    TEXT r0, r1, r15

    ; Total minutes
    LDI r20, SCRATCH
    STRO r20, "Minutes: "
    LDI r20, TICKS
    LOAD r6, r20
    LDI r1, 3600
    DIV r6, r1
    LDI r20, SCRATCH
    ADD r20, r0
    ADD r20, r0
    ADD r20, r0
    ADD r20, r0
    ADD r20, r0
    ADD r20, r0
    ADD r20, r0
    ADD r20, r0
    ADD r20, r0
    CALL write_number
    LDI r1, 0
    STORE r20, r1
    LDI r0, 8
    LDI r1, 150
    LDI r15, SCRATCH
    TEXT r0, r1, r15

    ; Tick rate info
    LDI r20, SCRATCH
    STRO r20, "60 frames = 1 sim second"
    LDI r1, 0
    STORE r20, r1
    LDI r0, 8
    LDI r1, 164
    LDI r15, SCRATCH
    TEXT r0, r1, r15

    ; ── Large seconds display panel ──
    LDI r0, 0
    LDI r1, 180
    LDI r15, 256
    LDI r11, 56
    LDI r2, 0x060612
    RECTF r0, r1, r15, r11, r2

    ; Elapsed time string
    LDI r20, SCRATCH
    STRO r20, "Elapsed: "
    LDI r6, 0
    ADD r6, r12
    CALL write_number
    LDI r1, 32
    STORE r20, r1
    ADD r20, r0
    LDI r1, 100            ; 'd'
    STORE r20, r1
    ADD r20, r0
    LDI r1, 32
    STORE r20, r1
    ADD r20, r0
    LDI r6, 0
    ADD r6, r8
    CALL write_two_digit
    LDI r1, 58
    STORE r20, r1
    ADD r20, r0
    LDI r6, 0
    ADD r6, r13
    CALL write_two_digit
    LDI r1, 58
    STORE r20, r1
    ADD r20, r0
    LDI r6, 0
    ADD r6, r5
    CALL write_two_digit
    LDI r1, 0
    STORE r20, r1
    LDI r0, 8
    LDI r1, 195
    LDI r15, SCRATCH
    TEXT r0, r1, r15

    ; ── Status bar ──
    LDI r0, 0
    LDI r1, 240
    LDI r15, 256
    LDI r11, 16
    LDI r2, 0x0A0A1A
    RECTF r0, r1, r15, r11, r2

    LDI r20, SCRATCH
    STRO r20, "Geometry OS Clock"
    LDI r1, 0
    STORE r20, r1
    LDI r0, 8
    LDI r1, 244
    LDI r15, SCRATCH
    TEXT r0, r1, r15

    POP r31
    RET

; =========================================
; WRITE_TWO_DIGIT: Write value in r6 as 2-digit decimal at SCRATCH[r20]
; Advances r20 by 2
; Expects r0 = 1
; =========================================
write_two_digit:
    PUSH r31
    LDI r0, 1

    ; Tens digit
    LDI r9, 0
    ADD r9, r6
    LDI r1, 10
    DIV r9, r1
    LDI r1, 48
    ADD r1, r9
    STORE r20, r1
    ADD r20, r0

    ; Ones digit
    LDI r9, 0
    ADD r9, r6
    LDI r1, 10
    MOD r9, r1
    LDI r1, 48
    ADD r1, r9
    STORE r20, r1
    ADD r20, r0

    POP r31
    RET

; =========================================
; WRITE_NUMBER: Write number r6 as decimal at SCRATCH[r20]
; Advances r20 past the digits
; Expects r0 = 1
; =========================================
write_number:
    PUSH r31
    LDI r0, 1

    ; Handle 0
    CMPI r6, 0
    JNZ r6, wn_not_zero
    LDI r1, 48
    STORE r20, r1
    ADD r20, r0
    POP r31
    RET

wn_not_zero:
    ; Push digits onto stack (ones first), then pop (most significant first)
    LDI r7, 0
    ADD r7, r6          ; r7 = remaining value
    LDI r9, 0           ; digit count

wn_push_loop:
    CMPI r7, 0
    JZ r7, wn_pop_loop
    LDI r16, 0
    ADD r16, r7
    LDI r1, 10
    MOD r16, r1          ; r16 = ones digit
    PUSH r16
    ADD r9, r0
    LDI r1, 10
    DIV r7, r1
    JMP wn_push_loop

wn_pop_loop:
    CMPI r9, 0
    JZ r9, wn_done
    POP r16
    LDI r1, 48
    ADD r1, r16
    STORE r20, r1
    ADD r20, r0
    SUB r9, r0
    JMP wn_pop_loop

wn_done:
    POP r31
    RET
