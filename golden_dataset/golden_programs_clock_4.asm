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
LDI r1, 1
LDI r30, 0xFD00

; Init blink counter
LDI r20, BLINK
LDI r12, 0
STORE r20, r12

; =========================================
; MAIN LOOP
; =========================================
main_loop:
    LDI r1, 1

    ; Draw everything
    CALL render

    ; Signal frame
    FRAME

    ; Update blink toggle
    LDI r20, TICKS
    LOAD r2, r20
    LDI r12, 30
    DIV r2, r12
    LDI r12, 2
    MOD r2, r12
    LDI r20, BLINK
    STORE r20, r2

    JMP main_loop

; =========================================
; RENDER
; =========================================
render:
    PUSH r31
    LDI r1, 1

    ; ── Background ──
    LDI r12, 0x0A0A1E
    FILL r12

    ; ── Title bar ──
    LDI r1, 0
    LDI r12, 0
    LDI r13, 256
    LDI r8, 20
    LDI r11, 0x0D1B2A
    RECTF r1, r12, r13, r8, r11

    LDI r20, SCRATCH
    STRO r20, "GeoClock v1.0"
    LDI r12, 0
    STORE r20, r12
    LDI r1, 8
    LDI r12, 6
    LDI r13, SCRATCH
    TEXT r1, r12, r13

    ; ── Info panel (date/day) ──
    LDI r1, 0
    LDI r12, 20
    LDI r13, 256
    LDI r8, 20
    LDI r11, 0x101828
    RECTF r1, r12, r13, r8, r11

    ; Compute time values
    ; total_seconds = frame_count / 60
    LDI r20, TICKS
    LOAD r2, r20
    LDI r12, 60
    DIV r2, r12
    ; r2 = total_seconds

    ; hours = total_seconds / 3600
    LDI r4, 0
    ADD r4, r2
    LDI r12, 3600
    DIV r4, r12
    ; r4 = hours

    ; minutes = (total_seconds % 3600) / 60
    LDI r3, 0
    ADD r3, r2
    LDI r12, 3600
    MOD r3, r12
    LDI r12, 60
    DIV r3, r12
    ; r3 = minutes

    ; seconds = total_seconds % 60
    LDI r7, 0
    ADD r7, r2
    LDI r12, 60
    MOD r7, r12
    ; r7 = seconds

    ; days = hours / 24
    LDI r10, 0
    ADD r10, r4
    LDI r12, 24
    DIV r10, r12
    ; r10 = days

    ; hours within day = hours % 24
    LDI r4, 0
    ADD r4, r2
    LDI r12, 3600
    DIV r4, r12
    LDI r12, 24
    MOD r4, r12
    ; r4 = hours (0-23)

    ; Build "Day N  HH:MM:SS" string
    LDI r20, SCRATCH
    STRO r20, "Day "
    LDI r2, 0
    ADD r2, r10
    CALL write_number
    LDI r12, 32
    STORE r20, r12
    ADD r20, r1

    ; Write hours (2-digit with leading zero)
    CALL write_two_digit
    ; Colon
    LDI r20, BLINK
    LOAD r6, r20
    CMPI r6, 0
    JNZ r6, colon_on1
    LDI r12, 32
    STORE r20, r12
    ADD r20, r1
    LDI r12, 32
    STORE r20, r12
    ADD r20, r1
    JMP colon_done1
colon_on1:
    LDI r12, 58
    STORE r20, r12
    ADD r20, r1
    LDI r12, 58
    STORE r20, r12
    ADD r20, r1
colon_done1:

    ; Write minutes
    LDI r2, 0
    ADD r2, r3
    CALL write_two_digit
    ; Colon
    LDI r20, BLINK
    LOAD r6, r20
    CMPI r6, 0
    JNZ r6, colon_on2
    LDI r12, 32
    STORE r20, r12
    ADD r20, r1
    LDI r12, 32
    STORE r20, r12
    ADD r20, r1
    JMP colon_done2
colon_on2:
    LDI r12, 58
    STORE r20, r12
    ADD r20, r1
    LDI r12, 58
    STORE r20, r12
    ADD r20, r1
colon_done2:

    ; Write seconds
    LDI r2, 0
    ADD r2, r7
    CALL write_two_digit

    ; Null terminate
    LDI r12, 0
    STORE r20, r12

    ; Render time string at top of info panel
    LDI r1, 8
    LDI r12, 24
    LDI r13, SCRATCH
    TEXT r1, r12, r13

    ; ── Main clock panel ──
    LDI r1, 0
    LDI r12, 40
    LDI r13, 256
    LDI r8, 80
    LDI r11, 0x060612
    RECTF r1, r12, r13, r8, r11

    ; Large time display using TEXT at y=60
    ; Build "HH:MM:SS" string again for the large display
    LDI r20, SCRATCH
    LDI r2, 0
    ADD r2, r4
    CALL write_two_digit
    LDI r12, 58
    STORE r20, r12
    ADD r20, r1
    LDI r2, 0
    ADD r2, r3
    CALL write_two_digit
    LDI r12, 58
    STORE r20, r12
    ADD r20, r1
    LDI r2, 0
    ADD r2, r7
    CALL write_two_digit
    LDI r12, 0
    STORE r20, r12

    LDI r1, 80
    LDI r12, 65
    LDI r13, SCRATCH
    TEXT r1, r12, r13

    ; ── Statistics panel ──
    LDI r1, 0
    LDI r12, 120
    LDI r13, 256
    LDI r8, 60
    LDI r11, 0x0D0D1A
    RECTF r1, r12, r13, r8, r11

    ; Frame count
    LDI r20, SCRATCH
    STRO r20, "Frames: "
    LDI r20, TICKS
    LOAD r2, r20
    LDI r20, SCRATCH
    ADD r20, r1
    ADD r20, r1
    ADD r20, r1
    ADD r20, r1
    ADD r20, r1
    ADD r20, r1
    ADD r20, r1
    ADD r20, r1
    CALL write_number
    LDI r12, 0
    STORE r20, r12
    LDI r1, 8
    LDI r12, 126
    LDI r13, SCRATCH
    TEXT r1, r12, r13

    ; Total seconds
    LDI r20, SCRATCH
    STRO r20, "Seconds: "
    LDI r20, TICKS
    LOAD r2, r20
    LDI r12, 60
    DIV r2, r12
    LDI r20, SCRATCH
    ADD r20, r1
    ADD r20, r1
    ADD r20, r1
    ADD r20, r1
    ADD r20, r1
    ADD r20, r1
    ADD r20, r1
    ADD r20, r1
    ADD r20, r1
    CALL write_number
    LDI r12, 0
    STORE r20, r12
    LDI r1, 8
    LDI r12, 138
    LDI r13, SCRATCH
    TEXT r1, r12, r13

    ; Total minutes
    LDI r20, SCRATCH
    STRO r20, "Minutes: "
    LDI r20, TICKS
    LOAD r2, r20
    LDI r12, 3600
    DIV r2, r12
    LDI r20, SCRATCH
    ADD r20, r1
    ADD r20, r1
    ADD r20, r1
    ADD r20, r1
    ADD r20, r1
    ADD r20, r1
    ADD r20, r1
    ADD r20, r1
    ADD r20, r1
    CALL write_number
    LDI r12, 0
    STORE r20, r12
    LDI r1, 8
    LDI r12, 150
    LDI r13, SCRATCH
    TEXT r1, r12, r13

    ; Tick rate info
    LDI r20, SCRATCH
    STRO r20, "60 frames = 1 sim second"
    LDI r12, 0
    STORE r20, r12
    LDI r1, 8
    LDI r12, 164
    LDI r13, SCRATCH
    TEXT r1, r12, r13

    ; ── Large seconds display panel ──
    LDI r1, 0
    LDI r12, 180
    LDI r13, 256
    LDI r8, 56
    LDI r11, 0x060612
    RECTF r1, r12, r13, r8, r11

    ; Elapsed time string
    LDI r20, SCRATCH
    STRO r20, "Elapsed: "
    LDI r2, 0
    ADD r2, r10
    CALL write_number
    LDI r12, 32
    STORE r20, r12
    ADD r20, r1
    LDI r12, 100            ; 'd'
    STORE r20, r12
    ADD r20, r1
    LDI r12, 32
    STORE r20, r12
    ADD r20, r1
    LDI r2, 0
    ADD r2, r4
    CALL write_two_digit
    LDI r12, 58
    STORE r20, r12
    ADD r20, r1
    LDI r2, 0
    ADD r2, r3
    CALL write_two_digit
    LDI r12, 58
    STORE r20, r12
    ADD r20, r1
    LDI r2, 0
    ADD r2, r7
    CALL write_two_digit
    LDI r12, 0
    STORE r20, r12
    LDI r1, 8
    LDI r12, 195
    LDI r13, SCRATCH
    TEXT r1, r12, r13

    ; ── Status bar ──
    LDI r1, 0
    LDI r12, 240
    LDI r13, 256
    LDI r8, 16
    LDI r11, 0x0A0A1A
    RECTF r1, r12, r13, r8, r11

    LDI r20, SCRATCH
    STRO r20, "Geometry OS Clock"
    LDI r12, 0
    STORE r20, r12
    LDI r1, 8
    LDI r12, 244
    LDI r13, SCRATCH
    TEXT r1, r12, r13

    POP r31
    RET

; =========================================
; WRITE_TWO_DIGIT: Write value in r2 as 2-digit decimal at SCRATCH[r20]
; Advances r20 by 2
; Expects r1 = 1
; =========================================
write_two_digit:
    PUSH r31
    LDI r1, 1

    ; Tens digit
    LDI r6, 0
    ADD r6, r2
    LDI r12, 10
    DIV r6, r12
    LDI r12, 48
    ADD r12, r6
    STORE r20, r12
    ADD r20, r1

    ; Ones digit
    LDI r6, 0
    ADD r6, r2
    LDI r12, 10
    MOD r6, r12
    LDI r12, 48
    ADD r12, r6
    STORE r20, r12
    ADD r20, r1

    POP r31
    RET

; =========================================
; WRITE_NUMBER: Write number r2 as decimal at SCRATCH[r20]
; Advances r20 past the digits
; Expects r1 = 1
; =========================================
write_number:
    PUSH r31
    LDI r1, 1

    ; Handle 0
    CMPI r2, 0
    JNZ r2, wn_not_zero
    LDI r12, 48
    STORE r20, r12
    ADD r20, r1
    POP r31
    RET

wn_not_zero:
    ; Push digits onto stack (ones first), then pop (most significant first)
    LDI r14, 0
    ADD r14, r2          ; r14 = remaining value
    LDI r6, 0           ; digit count

wn_push_loop:
    CMPI r14, 0
    JZ r14, wn_pop_loop
    LDI r16, 0
    ADD r16, r14
    LDI r12, 10
    MOD r16, r12          ; r16 = ones digit
    PUSH r16
    ADD r6, r1
    LDI r12, 10
    DIV r14, r12
    JMP wn_push_loop

wn_pop_loop:
    CMPI r6, 0
    JZ r6, wn_done
    POP r16
    LDI r12, 48
    ADD r12, r16
    STORE r20, r12
    ADD r20, r1
    SUB r6, r1
    JMP wn_pop_loop

wn_done:
    POP r31
    RET
