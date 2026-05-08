; DESCRIPTION: Render a colored object at the screen.

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
LDI r3, 0
STORE r20, r3

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
    LOAD r12, r20
    LDI r3, 30
    DIV r12, r3
    LDI r3, 2
    MOD r12, r3
    LDI r20, BLINK
    STORE r20, r12

    JMP main_loop

; =========================================
; RENDER
; =========================================
render:
    PUSH r31
    LDI r14, 1

    ; ── Background ──
    LDI r3, 0x0A0A1E
    FILL r3

    ; ── Title bar ──
    LDI r14, 0
    LDI r3, 0
    LDI r2, 256
    LDI r7, 20
    LDI r11, 0x0D1B2A
    RECTF r14, r3, r2, r7, r11

    LDI r20, SCRATCH
    STRO r20, "GeoClock v1.0"
    LDI r3, 0
    STORE r20, r3
    LDI r14, 8
    LDI r3, 6
    LDI r2, SCRATCH
    TEXT r14, r3, r2

    ; ── Info panel (date/day) ──
    LDI r14, 0
    LDI r3, 20
    LDI r2, 256
    LDI r7, 20
    LDI r11, 0x101828
    RECTF r14, r3, r2, r7, r11

    ; Compute time values
    ; total_seconds = frame_count / 60
    LDI r20, TICKS
    LOAD r12, r20
    LDI r3, 60
    DIV r12, r3
    ; r12 = total_seconds

    ; hours = total_seconds / 3600
    LDI r1, 0
    ADD r1, r12
    LDI r3, 3600
    DIV r1, r3
    ; r1 = hours

    ; minutes = (total_seconds % 3600) / 60
    LDI r6, 0
    ADD r6, r12
    LDI r3, 3600
    MOD r6, r3
    LDI r3, 60
    DIV r6, r3
    ; r6 = minutes

    ; seconds = total_seconds % 60
    LDI r10, 0
    ADD r10, r12
    LDI r3, 60
    MOD r10, r3
    ; r10 = seconds

    ; days = hours / 24
    LDI r0, 0
    ADD r0, r1
    LDI r3, 24
    DIV r0, r3
    ; r0 = days

    ; hours within day = hours % 24
    LDI r1, 0
    ADD r1, r12
    LDI r3, 3600
    DIV r1, r3
    LDI r3, 24
    MOD r1, r3
    ; r1 = hours (0-23)

    ; Build "Day N  HH:MM:SS" string
    LDI r20, SCRATCH
    STRO r20, "Day "
    LDI r12, 0
    ADD r12, r0
    CALL write_number
    LDI r3, 32
    STORE r20, r3
    ADD r20, r14

    ; Write hours (2-digit with leading zero)
    CALL write_two_digit
    ; Colon
    LDI r20, BLINK
    LOAD r9, r20
    CMPI r9, 0
    JNZ r9, colon_on1
    LDI r3, 32
    STORE r20, r3
    ADD r20, r14
    LDI r3, 32
    STORE r20, r3
    ADD r20, r14
    JMP colon_done1
colon_on1:
    LDI r3, 58
    STORE r20, r3
    ADD r20, r14
    LDI r3, 58
    STORE r20, r3
    ADD r20, r14
colon_done1:

    ; Write minutes
    LDI r12, 0
    ADD r12, r6
    CALL write_two_digit
    ; Colon
    LDI r20, BLINK
    LOAD r9, r20
    CMPI r9, 0
    JNZ r9, colon_on2
    LDI r3, 32
    STORE r20, r3
    ADD r20, r14
    LDI r3, 32
    STORE r20, r3
    ADD r20, r14
    JMP colon_done2
colon_on2:
    LDI r3, 58
    STORE r20, r3
    ADD r20, r14
    LDI r3, 58
    STORE r20, r3
    ADD r20, r14
colon_done2:

    ; Write seconds
    LDI r12, 0
    ADD r12, r10
    CALL write_two_digit

    ; Null terminate
    LDI r3, 0
    STORE r20, r3

    ; Render time string at top of info panel
    LDI r14, 8
    LDI r3, 24
    LDI r2, SCRATCH
    TEXT r14, r3, r2

    ; ── Main clock panel ──
    LDI r14, 0
    LDI r3, 40
    LDI r2, 256
    LDI r7, 80
    LDI r11, 0x060612
    RECTF r14, r3, r2, r7, r11

    ; Large time display using TEXT at y=60
    ; Build "HH:MM:SS" string again for the large display
    LDI r20, SCRATCH
    LDI r12, 0
    ADD r12, r1
    CALL write_two_digit
    LDI r3, 58
    STORE r20, r3
    ADD r20, r14
    LDI r12, 0
    ADD r12, r6
    CALL write_two_digit
    LDI r3, 58
    STORE r20, r3
    ADD r20, r14
    LDI r12, 0
    ADD r12, r10
    CALL write_two_digit
    LDI r3, 0
    STORE r20, r3

    LDI r14, 80
    LDI r3, 65
    LDI r2, SCRATCH
    TEXT r14, r3, r2

    ; ── Statistics panel ──
    LDI r14, 0
    LDI r3, 120
    LDI r2, 256
    LDI r7, 60
    LDI r11, 0x0D0D1A
    RECTF r14, r3, r2, r7, r11

    ; Frame count
    LDI r20, SCRATCH
    STRO r20, "Frames: "
    LDI r20, TICKS
    LOAD r12, r20
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
    LDI r3, 0
    STORE r20, r3
    LDI r14, 8
    LDI r3, 126
    LDI r2, SCRATCH
    TEXT r14, r3, r2

    ; Total seconds
    LDI r20, SCRATCH
    STRO r20, "Seconds: "
    LDI r20, TICKS
    LOAD r12, r20
    LDI r3, 60
    DIV r12, r3
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
    LDI r3, 0
    STORE r20, r3
    LDI r14, 8
    LDI r3, 138
    LDI r2, SCRATCH
    TEXT r14, r3, r2

    ; Total minutes
    LDI r20, SCRATCH
    STRO r20, "Minutes: "
    LDI r20, TICKS
    LOAD r12, r20
    LDI r3, 3600
    DIV r12, r3
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
    LDI r3, 0
    STORE r20, r3
    LDI r14, 8
    LDI r3, 150
    LDI r2, SCRATCH
    TEXT r14, r3, r2

    ; Tick rate info
    LDI r20, SCRATCH
    STRO r20, "60 frames = 1 sim second"
    LDI r3, 0
    STORE r20, r3
    LDI r14, 8
    LDI r3, 164
    LDI r2, SCRATCH
    TEXT r14, r3, r2

    ; ── Large seconds display panel ──
    LDI r14, 0
    LDI r3, 180
    LDI r2, 256
    LDI r7, 56
    LDI r11, 0x060612
    RECTF r14, r3, r2, r7, r11

    ; Elapsed time string
    LDI r20, SCRATCH
    STRO r20, "Elapsed: "
    LDI r12, 0
    ADD r12, r0
    CALL write_number
    LDI r3, 32
    STORE r20, r3
    ADD r20, r14
    LDI r3, 100            ; 'd'
    STORE r20, r3
    ADD r20, r14
    LDI r3, 32
    STORE r20, r3
    ADD r20, r14
    LDI r12, 0
    ADD r12, r1
    CALL write_two_digit
    LDI r3, 58
    STORE r20, r3
    ADD r20, r14
    LDI r12, 0
    ADD r12, r6
    CALL write_two_digit
    LDI r3, 58
    STORE r20, r3
    ADD r20, r14
    LDI r12, 0
    ADD r12, r10
    CALL write_two_digit
    LDI r3, 0
    STORE r20, r3
    LDI r14, 8
    LDI r3, 195
    LDI r2, SCRATCH
    TEXT r14, r3, r2

    ; ── Status bar ──
    LDI r14, 0
    LDI r3, 240
    LDI r2, 256
    LDI r7, 16
    LDI r11, 0x0A0A1A
    RECTF r14, r3, r2, r7, r11

    LDI r20, SCRATCH
    STRO r20, "Geometry OS Clock"
    LDI r3, 0
    STORE r20, r3
    LDI r14, 8
    LDI r3, 244
    LDI r2, SCRATCH
    TEXT r14, r3, r2

    POP r31
    RET

; =========================================
; WRITE_TWO_DIGIT: Write value in r12 as 2-digit decimal at SCRATCH[r20]
; Advances r20 by 2
; Expects r14 = 1
; =========================================
write_two_digit:
    PUSH r31
    LDI r14, 1

    ; Tens digit
    LDI r9, 0
    ADD r9, r12
    LDI r3, 10
    DIV r9, r3
    LDI r3, 48
    ADD r3, r9
    STORE r20, r3
    ADD r20, r14

    ; Ones digit
    LDI r9, 0
    ADD r9, r12
    LDI r3, 10
    MOD r9, r3
    LDI r3, 48
    ADD r3, r9
    STORE r20, r3
    ADD r20, r14

    POP r31
    RET

; =========================================
; WRITE_NUMBER: Write number r12 as decimal at SCRATCH[r20]
; Advances r20 past the digits
; Expects r14 = 1
; =========================================
write_number:
    PUSH r31
    LDI r14, 1

    ; Handle 0
    CMPI r12, 0
    JNZ r12, wn_not_zero
    LDI r3, 48
    STORE r20, r3
    ADD r20, r14
    POP r31
    RET

wn_not_zero:
    ; Push digits onto stack (ones first), then pop (most significant first)
    LDI r4, 0
    ADD r4, r12          ; r4 = remaining value
    LDI r9, 0           ; digit count

wn_push_loop:
    CMPI r4, 0
    JZ r4, wn_pop_loop
    LDI r16, 0
    ADD r16, r4
    LDI r3, 10
    MOD r16, r3          ; r16 = ones digit
    PUSH r16
    ADD r9, r14
    LDI r3, 10
    DIV r4, r3
    JMP wn_push_loop

wn_pop_loop:
    CMPI r9, 0
    JZ r9, wn_done
    POP r16
    LDI r3, 48
    ADD r3, r16
    STORE r20, r3
    ADD r20, r14
    SUB r9, r14
    JMP wn_pop_loop

wn_done:
    POP r31
    RET
