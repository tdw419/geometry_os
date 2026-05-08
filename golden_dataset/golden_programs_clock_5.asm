; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

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
LDI r7, 0
STORE r20, r7

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
    LOAD r1, r20
    LDI r7, 30
    DIV r1, r7
    LDI r7, 2
    MOD r1, r7
    LDI r20, BLINK
    STORE r20, r1

    JMP main_loop

; =========================================
; RENDER
; =========================================
render:
    PUSH r31
    LDI r14, 1

    ; ── Background ──
    LDI r7, 0x0A0A1E
    FILL r7

    ; ── Title bar ──
    LDI r14, 0
    LDI r7, 0
    LDI r11, 256
    LDI r5, 20
    LDI r13, 0x0D1B2A
    RECTF r14, r7, r11, r5, r13

    LDI r20, SCRATCH
    STRO r20, "GeoClock v1.0"
    LDI r7, 0
    STORE r20, r7
    LDI r14, 8
    LDI r7, 6
    LDI r11, SCRATCH
    TEXT r14, r7, r11

    ; ── Info panel (date/day) ──
    LDI r14, 0
    LDI r7, 20
    LDI r11, 256
    LDI r5, 20
    LDI r13, 0x101828
    RECTF r14, r7, r11, r5, r13

    ; Compute time values
    ; total_seconds = frame_count / 60
    LDI r20, TICKS
    LOAD r1, r20
    LDI r7, 60
    DIV r1, r7
    ; r1 = total_seconds

    ; hours = total_seconds / 3600
    LDI r8, 0
    ADD r8, r1
    LDI r7, 3600
    DIV r8, r7
    ; r8 = hours

    ; minutes = (total_seconds % 3600) / 60
    LDI r3, 0
    ADD r3, r1
    LDI r7, 3600
    MOD r3, r7
    LDI r7, 60
    DIV r3, r7
    ; r3 = minutes

    ; seconds = total_seconds % 60
    LDI r2, 0
    ADD r2, r1
    LDI r7, 60
    MOD r2, r7
    ; r2 = seconds

    ; days = hours / 24
    LDI r9, 0
    ADD r9, r8
    LDI r7, 24
    DIV r9, r7
    ; r9 = days

    ; hours within day = hours % 24
    LDI r8, 0
    ADD r8, r1
    LDI r7, 3600
    DIV r8, r7
    LDI r7, 24
    MOD r8, r7
    ; r8 = hours (0-23)

    ; Build "Day N  HH:MM:SS" string
    LDI r20, SCRATCH
    STRO r20, "Day "
    LDI r1, 0
    ADD r1, r9
    CALL write_number
    LDI r7, 32
    STORE r20, r7
    ADD r20, r14

    ; Write hours (2-digit with leading zero)
    CALL write_two_digit
    ; Colon
    LDI r20, BLINK
    LOAD r10, r20
    CMPI r10, 0
    JNZ r10, colon_on1
    LDI r7, 32
    STORE r20, r7
    ADD r20, r14
    LDI r7, 32
    STORE r20, r7
    ADD r20, r14
    JMP colon_done1
colon_on1:
    LDI r7, 58
    STORE r20, r7
    ADD r20, r14
    LDI r7, 58
    STORE r20, r7
    ADD r20, r14
colon_done1:

    ; Write minutes
    LDI r1, 0
    ADD r1, r3
    CALL write_two_digit
    ; Colon
    LDI r20, BLINK
    LOAD r10, r20
    CMPI r10, 0
    JNZ r10, colon_on2
    LDI r7, 32
    STORE r20, r7
    ADD r20, r14
    LDI r7, 32
    STORE r20, r7
    ADD r20, r14
    JMP colon_done2
colon_on2:
    LDI r7, 58
    STORE r20, r7
    ADD r20, r14
    LDI r7, 58
    STORE r20, r7
    ADD r20, r14
colon_done2:

    ; Write seconds
    LDI r1, 0
    ADD r1, r2
    CALL write_two_digit

    ; Null terminate
    LDI r7, 0
    STORE r20, r7

    ; Render time string at top of info panel
    LDI r14, 8
    LDI r7, 24
    LDI r11, SCRATCH
    TEXT r14, r7, r11

    ; ── Main clock panel ──
    LDI r14, 0
    LDI r7, 40
    LDI r11, 256
    LDI r5, 80
    LDI r13, 0x060612
    RECTF r14, r7, r11, r5, r13

    ; Large time display using TEXT at y=60
    ; Build "HH:MM:SS" string again for the large display
    LDI r20, SCRATCH
    LDI r1, 0
    ADD r1, r8
    CALL write_two_digit
    LDI r7, 58
    STORE r20, r7
    ADD r20, r14
    LDI r1, 0
    ADD r1, r3
    CALL write_two_digit
    LDI r7, 58
    STORE r20, r7
    ADD r20, r14
    LDI r1, 0
    ADD r1, r2
    CALL write_two_digit
    LDI r7, 0
    STORE r20, r7

    LDI r14, 80
    LDI r7, 65
    LDI r11, SCRATCH
    TEXT r14, r7, r11

    ; ── Statistics panel ──
    LDI r14, 0
    LDI r7, 120
    LDI r11, 256
    LDI r5, 60
    LDI r13, 0x0D0D1A
    RECTF r14, r7, r11, r5, r13

    ; Frame count
    LDI r20, SCRATCH
    STRO r20, "Frames: "
    LDI r20, TICKS
    LOAD r1, r20
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
    LDI r7, 0
    STORE r20, r7
    LDI r14, 8
    LDI r7, 126
    LDI r11, SCRATCH
    TEXT r14, r7, r11

    ; Total seconds
    LDI r20, SCRATCH
    STRO r20, "Seconds: "
    LDI r20, TICKS
    LOAD r1, r20
    LDI r7, 60
    DIV r1, r7
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
    LDI r7, 0
    STORE r20, r7
    LDI r14, 8
    LDI r7, 138
    LDI r11, SCRATCH
    TEXT r14, r7, r11

    ; Total minutes
    LDI r20, SCRATCH
    STRO r20, "Minutes: "
    LDI r20, TICKS
    LOAD r1, r20
    LDI r7, 3600
    DIV r1, r7
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
    LDI r7, 0
    STORE r20, r7
    LDI r14, 8
    LDI r7, 150
    LDI r11, SCRATCH
    TEXT r14, r7, r11

    ; Tick rate info
    LDI r20, SCRATCH
    STRO r20, "60 frames = 1 sim second"
    LDI r7, 0
    STORE r20, r7
    LDI r14, 8
    LDI r7, 164
    LDI r11, SCRATCH
    TEXT r14, r7, r11

    ; ── Large seconds display panel ──
    LDI r14, 0
    LDI r7, 180
    LDI r11, 256
    LDI r5, 56
    LDI r13, 0x060612
    RECTF r14, r7, r11, r5, r13

    ; Elapsed time string
    LDI r20, SCRATCH
    STRO r20, "Elapsed: "
    LDI r1, 0
    ADD r1, r9
    CALL write_number
    LDI r7, 32
    STORE r20, r7
    ADD r20, r14
    LDI r7, 100            ; 'd'
    STORE r20, r7
    ADD r20, r14
    LDI r7, 32
    STORE r20, r7
    ADD r20, r14
    LDI r1, 0
    ADD r1, r8
    CALL write_two_digit
    LDI r7, 58
    STORE r20, r7
    ADD r20, r14
    LDI r1, 0
    ADD r1, r3
    CALL write_two_digit
    LDI r7, 58
    STORE r20, r7
    ADD r20, r14
    LDI r1, 0
    ADD r1, r2
    CALL write_two_digit
    LDI r7, 0
    STORE r20, r7
    LDI r14, 8
    LDI r7, 195
    LDI r11, SCRATCH
    TEXT r14, r7, r11

    ; ── Status bar ──
    LDI r14, 0
    LDI r7, 240
    LDI r11, 256
    LDI r5, 16
    LDI r13, 0x0A0A1A
    RECTF r14, r7, r11, r5, r13

    LDI r20, SCRATCH
    STRO r20, "Geometry OS Clock"
    LDI r7, 0
    STORE r20, r7
    LDI r14, 8
    LDI r7, 244
    LDI r11, SCRATCH
    TEXT r14, r7, r11

    POP r31
    RET

; =========================================
; WRITE_TWO_DIGIT: Write value in r1 as 2-digit decimal at SCRATCH[r20]
; Advances r20 by 2
; Expects r14 = 1
; =========================================
write_two_digit:
    PUSH r31
    LDI r14, 1

    ; Tens digit
    LDI r10, 0
    ADD r10, r1
    LDI r7, 10
    DIV r10, r7
    LDI r7, 48
    ADD r7, r10
    STORE r20, r7
    ADD r20, r14

    ; Ones digit
    LDI r10, 0
    ADD r10, r1
    LDI r7, 10
    MOD r10, r7
    LDI r7, 48
    ADD r7, r10
    STORE r20, r7
    ADD r20, r14

    POP r31
    RET

; =========================================
; WRITE_NUMBER: Write number r1 as decimal at SCRATCH[r20]
; Advances r20 past the digits
; Expects r14 = 1
; =========================================
write_number:
    PUSH r31
    LDI r14, 1

    ; Handle 0
    CMPI r1, 0
    JNZ r1, wn_not_zero
    LDI r7, 48
    STORE r20, r7
    ADD r20, r14
    POP r31
    RET

wn_not_zero:
    ; Push digits onto stack (ones first), then pop (most significant first)
    LDI r6, 0
    ADD r6, r1          ; r6 = remaining value
    LDI r10, 0           ; digit count

wn_push_loop:
    CMPI r6, 0
    JZ r6, wn_pop_loop
    LDI r16, 0
    ADD r16, r6
    LDI r7, 10
    MOD r16, r7          ; r16 = ones digit
    PUSH r16
    ADD r10, r14
    LDI r7, 10
    DIV r6, r7
    JMP wn_push_loop

wn_pop_loop:
    CMPI r10, 0
    JZ r10, wn_done
    POP r16
    LDI r7, 48
    ADD r7, r16
    STORE r20, r7
    ADD r20, r14
    SUB r10, r14
    JMP wn_pop_loop

wn_done:
    POP r31
    RET
