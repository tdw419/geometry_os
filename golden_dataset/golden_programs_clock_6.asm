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
LDI r6, 1
LDI r30, 0xFD00

; Init blink counter
LDI r20, BLINK
LDI r9, 0
STORE r20, r9

; =========================================
; MAIN LOOP
; =========================================
main_loop:
    LDI r6, 1

    ; Draw everything
    CALL render

    ; Signal frame
    FRAME

    ; Update blink toggle
    LDI r20, TICKS
    LOAD r3, r20
    LDI r9, 30
    DIV r3, r9
    LDI r9, 2
    MOD r3, r9
    LDI r20, BLINK
    STORE r20, r3

    JMP main_loop

; =========================================
; RENDER
; =========================================
render:
    PUSH r31
    LDI r6, 1

    ; ── Background ──
    LDI r9, 0x0A0A1E
    FILL r9

    ; ── Title bar ──
    LDI r6, 0
    LDI r9, 0
    LDI r10, 256
    LDI r8, 20
    LDI r13, 0x0D1B2A
    RECTF r6, r9, r10, r8, r13

    LDI r20, SCRATCH
    STRO r20, "GeoClock v1.0"
    LDI r9, 0
    STORE r20, r9
    LDI r6, 8
    LDI r9, 6
    LDI r10, SCRATCH
    TEXT r6, r9, r10

    ; ── Info panel (date/day) ──
    LDI r6, 0
    LDI r9, 20
    LDI r10, 256
    LDI r8, 20
    LDI r13, 0x101828
    RECTF r6, r9, r10, r8, r13

    ; Compute time values
    ; total_seconds = frame_count / 60
    LDI r20, TICKS
    LOAD r3, r20
    LDI r9, 60
    DIV r3, r9
    ; r3 = total_seconds

    ; hours = total_seconds / 3600
    LDI r11, 0
    ADD r11, r3
    LDI r9, 3600
    DIV r11, r9
    ; r11 = hours

    ; minutes = (total_seconds % 3600) / 60
    LDI r4, 0
    ADD r4, r3
    LDI r9, 3600
    MOD r4, r9
    LDI r9, 60
    DIV r4, r9
    ; r4 = minutes

    ; seconds = total_seconds % 60
    LDI r2, 0
    ADD r2, r3
    LDI r9, 60
    MOD r2, r9
    ; r2 = seconds

    ; days = hours / 24
    LDI r1, 0
    ADD r1, r11
    LDI r9, 24
    DIV r1, r9
    ; r1 = days

    ; hours within day = hours % 24
    LDI r11, 0
    ADD r11, r3
    LDI r9, 3600
    DIV r11, r9
    LDI r9, 24
    MOD r11, r9
    ; r11 = hours (0-23)

    ; Build "Day N  HH:MM:SS" string
    LDI r20, SCRATCH
    STRO r20, "Day "
    LDI r3, 0
    ADD r3, r1
    CALL write_number
    LDI r9, 32
    STORE r20, r9
    ADD r20, r6

    ; Write hours (2-digit with leading zero)
    CALL write_two_digit
    ; Colon
    LDI r20, BLINK
    LOAD r14, r20
    CMPI r14, 0
    JNZ r14, colon_on1
    LDI r9, 32
    STORE r20, r9
    ADD r20, r6
    LDI r9, 32
    STORE r20, r9
    ADD r20, r6
    JMP colon_done1
colon_on1:
    LDI r9, 58
    STORE r20, r9
    ADD r20, r6
    LDI r9, 58
    STORE r20, r9
    ADD r20, r6
colon_done1:

    ; Write minutes
    LDI r3, 0
    ADD r3, r4
    CALL write_two_digit
    ; Colon
    LDI r20, BLINK
    LOAD r14, r20
    CMPI r14, 0
    JNZ r14, colon_on2
    LDI r9, 32
    STORE r20, r9
    ADD r20, r6
    LDI r9, 32
    STORE r20, r9
    ADD r20, r6
    JMP colon_done2
colon_on2:
    LDI r9, 58
    STORE r20, r9
    ADD r20, r6
    LDI r9, 58
    STORE r20, r9
    ADD r20, r6
colon_done2:

    ; Write seconds
    LDI r3, 0
    ADD r3, r2
    CALL write_two_digit

    ; Null terminate
    LDI r9, 0
    STORE r20, r9

    ; Render time string at top of info panel
    LDI r6, 8
    LDI r9, 24
    LDI r10, SCRATCH
    TEXT r6, r9, r10

    ; ── Main clock panel ──
    LDI r6, 0
    LDI r9, 40
    LDI r10, 256
    LDI r8, 80
    LDI r13, 0x060612
    RECTF r6, r9, r10, r8, r13

    ; Large time display using TEXT at y=60
    ; Build "HH:MM:SS" string again for the large display
    LDI r20, SCRATCH
    LDI r3, 0
    ADD r3, r11
    CALL write_two_digit
    LDI r9, 58
    STORE r20, r9
    ADD r20, r6
    LDI r3, 0
    ADD r3, r4
    CALL write_two_digit
    LDI r9, 58
    STORE r20, r9
    ADD r20, r6
    LDI r3, 0
    ADD r3, r2
    CALL write_two_digit
    LDI r9, 0
    STORE r20, r9

    LDI r6, 80
    LDI r9, 65
    LDI r10, SCRATCH
    TEXT r6, r9, r10

    ; ── Statistics panel ──
    LDI r6, 0
    LDI r9, 120
    LDI r10, 256
    LDI r8, 60
    LDI r13, 0x0D0D1A
    RECTF r6, r9, r10, r8, r13

    ; Frame count
    LDI r20, SCRATCH
    STRO r20, "Frames: "
    LDI r20, TICKS
    LOAD r3, r20
    LDI r20, SCRATCH
    ADD r20, r6
    ADD r20, r6
    ADD r20, r6
    ADD r20, r6
    ADD r20, r6
    ADD r20, r6
    ADD r20, r6
    ADD r20, r6
    CALL write_number
    LDI r9, 0
    STORE r20, r9
    LDI r6, 8
    LDI r9, 126
    LDI r10, SCRATCH
    TEXT r6, r9, r10

    ; Total seconds
    LDI r20, SCRATCH
    STRO r20, "Seconds: "
    LDI r20, TICKS
    LOAD r3, r20
    LDI r9, 60
    DIV r3, r9
    LDI r20, SCRATCH
    ADD r20, r6
    ADD r20, r6
    ADD r20, r6
    ADD r20, r6
    ADD r20, r6
    ADD r20, r6
    ADD r20, r6
    ADD r20, r6
    ADD r20, r6
    CALL write_number
    LDI r9, 0
    STORE r20, r9
    LDI r6, 8
    LDI r9, 138
    LDI r10, SCRATCH
    TEXT r6, r9, r10

    ; Total minutes
    LDI r20, SCRATCH
    STRO r20, "Minutes: "
    LDI r20, TICKS
    LOAD r3, r20
    LDI r9, 3600
    DIV r3, r9
    LDI r20, SCRATCH
    ADD r20, r6
    ADD r20, r6
    ADD r20, r6
    ADD r20, r6
    ADD r20, r6
    ADD r20, r6
    ADD r20, r6
    ADD r20, r6
    ADD r20, r6
    CALL write_number
    LDI r9, 0
    STORE r20, r9
    LDI r6, 8
    LDI r9, 150
    LDI r10, SCRATCH
    TEXT r6, r9, r10

    ; Tick rate info
    LDI r20, SCRATCH
    STRO r20, "60 frames = 1 sim second"
    LDI r9, 0
    STORE r20, r9
    LDI r6, 8
    LDI r9, 164
    LDI r10, SCRATCH
    TEXT r6, r9, r10

    ; ── Large seconds display panel ──
    LDI r6, 0
    LDI r9, 180
    LDI r10, 256
    LDI r8, 56
    LDI r13, 0x060612
    RECTF r6, r9, r10, r8, r13

    ; Elapsed time string
    LDI r20, SCRATCH
    STRO r20, "Elapsed: "
    LDI r3, 0
    ADD r3, r1
    CALL write_number
    LDI r9, 32
    STORE r20, r9
    ADD r20, r6
    LDI r9, 100            ; 'd'
    STORE r20, r9
    ADD r20, r6
    LDI r9, 32
    STORE r20, r9
    ADD r20, r6
    LDI r3, 0
    ADD r3, r11
    CALL write_two_digit
    LDI r9, 58
    STORE r20, r9
    ADD r20, r6
    LDI r3, 0
    ADD r3, r4
    CALL write_two_digit
    LDI r9, 58
    STORE r20, r9
    ADD r20, r6
    LDI r3, 0
    ADD r3, r2
    CALL write_two_digit
    LDI r9, 0
    STORE r20, r9
    LDI r6, 8
    LDI r9, 195
    LDI r10, SCRATCH
    TEXT r6, r9, r10

    ; ── Status bar ──
    LDI r6, 0
    LDI r9, 240
    LDI r10, 256
    LDI r8, 16
    LDI r13, 0x0A0A1A
    RECTF r6, r9, r10, r8, r13

    LDI r20, SCRATCH
    STRO r20, "Geometry OS Clock"
    LDI r9, 0
    STORE r20, r9
    LDI r6, 8
    LDI r9, 244
    LDI r10, SCRATCH
    TEXT r6, r9, r10

    POP r31
    RET

; =========================================
; WRITE_TWO_DIGIT: Write value in r3 as 2-digit decimal at SCRATCH[r20]
; Advances r20 by 2
; Expects r6 = 1
; =========================================
write_two_digit:
    PUSH r31
    LDI r6, 1

    ; Tens digit
    LDI r14, 0
    ADD r14, r3
    LDI r9, 10
    DIV r14, r9
    LDI r9, 48
    ADD r9, r14
    STORE r20, r9
    ADD r20, r6

    ; Ones digit
    LDI r14, 0
    ADD r14, r3
    LDI r9, 10
    MOD r14, r9
    LDI r9, 48
    ADD r9, r14
    STORE r20, r9
    ADD r20, r6

    POP r31
    RET

; =========================================
; WRITE_NUMBER: Write number r3 as decimal at SCRATCH[r20]
; Advances r20 past the digits
; Expects r6 = 1
; =========================================
write_number:
    PUSH r31
    LDI r6, 1

    ; Handle 0
    CMPI r3, 0
    JNZ r3, wn_not_zero
    LDI r9, 48
    STORE r20, r9
    ADD r20, r6
    POP r31
    RET

wn_not_zero:
    ; Push digits onto stack (ones first), then pop (most significant first)
    LDI r5, 0
    ADD r5, r3          ; r5 = remaining value
    LDI r14, 0           ; digit count

wn_push_loop:
    CMPI r5, 0
    JZ r5, wn_pop_loop
    LDI r16, 0
    ADD r16, r5
    LDI r9, 10
    MOD r16, r9          ; r16 = ones digit
    PUSH r16
    ADD r14, r6
    LDI r9, 10
    DIV r5, r9
    JMP wn_push_loop

wn_pop_loop:
    CMPI r14, 0
    JZ r14, wn_done
    POP r16
    LDI r9, 48
    ADD r9, r16
    STORE r20, r9
    ADD r20, r6
    SUB r14, r6
    JMP wn_pop_loop

wn_done:
    POP r31
    RET
