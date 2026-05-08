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
LDI r14, 1
LDI r30, 0xFD00

; Init blink counter
LDI r20, BLINK
LDI r12, 0
STORE r20, r12

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
    LDI r12, 30
    DIV r4, r12
    LDI r12, 2
    MOD r4, r12
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
    LDI r12, 0x0A0A1E
    FILL r12

    ; ── Title bar ──
    LDI r14, 0
    LDI r12, 0
    LDI r8, 256
    LDI r13, 20
    LDI r6, 0x0D1B2A
    RECTF r14, r12, r8, r13, r6

    LDI r20, SCRATCH
    STRO r20, "GeoClock v1.0"
    LDI r12, 0
    STORE r20, r12
    LDI r14, 8
    LDI r12, 6
    LDI r8, SCRATCH
    TEXT r14, r12, r8

    ; ── Info panel (date/day) ──
    LDI r14, 0
    LDI r12, 20
    LDI r8, 256
    LDI r13, 20
    LDI r6, 0x101828
    RECTF r14, r12, r8, r13, r6

    ; Compute time values
    ; total_seconds = frame_count / 60
    LDI r20, TICKS
    LOAD r4, r20
    LDI r12, 60
    DIV r4, r12
    ; r4 = total_seconds

    ; hours = total_seconds / 3600
    LDI r0, 0
    ADD r0, r4
    LDI r12, 3600
    DIV r0, r12
    ; r0 = hours

    ; minutes = (total_seconds % 3600) / 60
    LDI r1, 0
    ADD r1, r4
    LDI r12, 3600
    MOD r1, r12
    LDI r12, 60
    DIV r1, r12
    ; r1 = minutes

    ; seconds = total_seconds % 60
    LDI r5, 0
    ADD r5, r4
    LDI r12, 60
    MOD r5, r12
    ; r5 = seconds

    ; days = hours / 24
    LDI r2, 0
    ADD r2, r0
    LDI r12, 24
    DIV r2, r12
    ; r2 = days

    ; hours within day = hours % 24
    LDI r0, 0
    ADD r0, r4
    LDI r12, 3600
    DIV r0, r12
    LDI r12, 24
    MOD r0, r12
    ; r0 = hours (0-23)

    ; Build "Day N  HH:MM:SS" string
    LDI r20, SCRATCH
    STRO r20, "Day "
    LDI r4, 0
    ADD r4, r2
    CALL write_number
    LDI r12, 32
    STORE r20, r12
    ADD r20, r14

    ; Write hours (2-digit with leading zero)
    CALL write_two_digit
    ; Colon
    LDI r20, BLINK
    LOAD r15, r20
    CMPI r15, 0
    JNZ r15, colon_on1
    LDI r12, 32
    STORE r20, r12
    ADD r20, r14
    LDI r12, 32
    STORE r20, r12
    ADD r20, r14
    JMP colon_done1
colon_on1:
    LDI r12, 58
    STORE r20, r12
    ADD r20, r14
    LDI r12, 58
    STORE r20, r12
    ADD r20, r14
colon_done1:

    ; Write minutes
    LDI r4, 0
    ADD r4, r1
    CALL write_two_digit
    ; Colon
    LDI r20, BLINK
    LOAD r15, r20
    CMPI r15, 0
    JNZ r15, colon_on2
    LDI r12, 32
    STORE r20, r12
    ADD r20, r14
    LDI r12, 32
    STORE r20, r12
    ADD r20, r14
    JMP colon_done2
colon_on2:
    LDI r12, 58
    STORE r20, r12
    ADD r20, r14
    LDI r12, 58
    STORE r20, r12
    ADD r20, r14
colon_done2:

    ; Write seconds
    LDI r4, 0
    ADD r4, r5
    CALL write_two_digit

    ; Null terminate
    LDI r12, 0
    STORE r20, r12

    ; Render time string at top of info panel
    LDI r14, 8
    LDI r12, 24
    LDI r8, SCRATCH
    TEXT r14, r12, r8

    ; ── Main clock panel ──
    LDI r14, 0
    LDI r12, 40
    LDI r8, 256
    LDI r13, 80
    LDI r6, 0x060612
    RECTF r14, r12, r8, r13, r6

    ; Large time display using TEXT at y=60
    ; Build "HH:MM:SS" string again for the large display
    LDI r20, SCRATCH
    LDI r4, 0
    ADD r4, r0
    CALL write_two_digit
    LDI r12, 58
    STORE r20, r12
    ADD r20, r14
    LDI r4, 0
    ADD r4, r1
    CALL write_two_digit
    LDI r12, 58
    STORE r20, r12
    ADD r20, r14
    LDI r4, 0
    ADD r4, r5
    CALL write_two_digit
    LDI r12, 0
    STORE r20, r12

    LDI r14, 80
    LDI r12, 65
    LDI r8, SCRATCH
    TEXT r14, r12, r8

    ; ── Statistics panel ──
    LDI r14, 0
    LDI r12, 120
    LDI r8, 256
    LDI r13, 60
    LDI r6, 0x0D0D1A
    RECTF r14, r12, r8, r13, r6

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
    LDI r12, 0
    STORE r20, r12
    LDI r14, 8
    LDI r12, 126
    LDI r8, SCRATCH
    TEXT r14, r12, r8

    ; Total seconds
    LDI r20, SCRATCH
    STRO r20, "Seconds: "
    LDI r20, TICKS
    LOAD r4, r20
    LDI r12, 60
    DIV r4, r12
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
    LDI r12, 0
    STORE r20, r12
    LDI r14, 8
    LDI r12, 138
    LDI r8, SCRATCH
    TEXT r14, r12, r8

    ; Total minutes
    LDI r20, SCRATCH
    STRO r20, "Minutes: "
    LDI r20, TICKS
    LOAD r4, r20
    LDI r12, 3600
    DIV r4, r12
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
    LDI r12, 0
    STORE r20, r12
    LDI r14, 8
    LDI r12, 150
    LDI r8, SCRATCH
    TEXT r14, r12, r8

    ; Tick rate info
    LDI r20, SCRATCH
    STRO r20, "60 frames = 1 sim second"
    LDI r12, 0
    STORE r20, r12
    LDI r14, 8
    LDI r12, 164
    LDI r8, SCRATCH
    TEXT r14, r12, r8

    ; ── Large seconds display panel ──
    LDI r14, 0
    LDI r12, 180
    LDI r8, 256
    LDI r13, 56
    LDI r6, 0x060612
    RECTF r14, r12, r8, r13, r6

    ; Elapsed time string
    LDI r20, SCRATCH
    STRO r20, "Elapsed: "
    LDI r4, 0
    ADD r4, r2
    CALL write_number
    LDI r12, 32
    STORE r20, r12
    ADD r20, r14
    LDI r12, 100            ; 'd'
    STORE r20, r12
    ADD r20, r14
    LDI r12, 32
    STORE r20, r12
    ADD r20, r14
    LDI r4, 0
    ADD r4, r0
    CALL write_two_digit
    LDI r12, 58
    STORE r20, r12
    ADD r20, r14
    LDI r4, 0
    ADD r4, r1
    CALL write_two_digit
    LDI r12, 58
    STORE r20, r12
    ADD r20, r14
    LDI r4, 0
    ADD r4, r5
    CALL write_two_digit
    LDI r12, 0
    STORE r20, r12
    LDI r14, 8
    LDI r12, 195
    LDI r8, SCRATCH
    TEXT r14, r12, r8

    ; ── Status bar ──
    LDI r14, 0
    LDI r12, 240
    LDI r8, 256
    LDI r13, 16
    LDI r6, 0x0A0A1A
    RECTF r14, r12, r8, r13, r6

    LDI r20, SCRATCH
    STRO r20, "Geometry OS Clock"
    LDI r12, 0
    STORE r20, r12
    LDI r14, 8
    LDI r12, 244
    LDI r8, SCRATCH
    TEXT r14, r12, r8

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
    LDI r15, 0
    ADD r15, r4
    LDI r12, 10
    DIV r15, r12
    LDI r12, 48
    ADD r12, r15
    STORE r20, r12
    ADD r20, r14

    ; Ones digit
    LDI r15, 0
    ADD r15, r4
    LDI r12, 10
    MOD r15, r12
    LDI r12, 48
    ADD r12, r15
    STORE r20, r12
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
    LDI r12, 48
    STORE r20, r12
    ADD r20, r14
    POP r31
    RET

wn_not_zero:
    ; Push digits onto stack (ones first), then pop (most significant first)
    LDI r10, 0
    ADD r10, r4          ; r10 = remaining value
    LDI r15, 0           ; digit count

wn_push_loop:
    CMPI r10, 0
    JZ r10, wn_pop_loop
    LDI r16, 0
    ADD r16, r10
    LDI r12, 10
    MOD r16, r12          ; r16 = ones digit
    PUSH r16
    ADD r15, r14
    LDI r12, 10
    DIV r10, r12
    JMP wn_push_loop

wn_pop_loop:
    CMPI r15, 0
    JZ r15, wn_done
    POP r16
    LDI r12, 48
    ADD r12, r16
    STORE r20, r12
    ADD r20, r14
    SUB r15, r14
    JMP wn_pop_loop

wn_done:
    POP r31
    RET
