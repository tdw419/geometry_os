; DESCRIPTION: Draws a colored object at the screen with fixed size.

; pulse.asm -- Self-Animating Pulse Bar for Geometry OS
;
; Proves: self-driven state change with zero external input.
;         No IKEY, no HITQ -- purely FRAME-driven animation.
;
; RAM Layout:
;   0x200        tick counter (increments every frame)
;   0x204        bar width (oscillates via triangle wave from tick)
;   0xFFE        frame_count (written by FRAME opcode, read-only for us)
;
; The animation:
;   - A colored bar grows right then shrinks left, cycling forever
;   - Tick increments each frame, bar_width = triangle_wave(tick % 200)
;   - Triangle wave: ramp up 0->100 in 100 frames, ramp down 100->0 in 100 frames
;   - Color shifts with tick for visual feedback
;
; Registers:
;   r9  - constant 1
;   r3  - scratch
;   r14  - scratch (tick, temp)
;   r8  - color
;   r7  - bar width
;   r13  - divisor/modulus (200, 100)
;   r15  - phase (tick % 200)
;   r6  - frame_count from RAM[0xFFE]
;

#define TICK      0x200
#define BAR_W     0x204
#define SCRATCH   0x300
#define FCOUNT    0xFFE

; ── INIT ──────────────────────────────────────
LDI r9, 1

; tick = 0
LDI r3, TICK
LDI r14, 0
STORE r3, r14

; bar_width = 0
LDI r3, BAR_W
LDI r14, 0
STORE r3, r14

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r9, 1

    ; ── UPDATE STATE ──

    ; Increment tick
    LDI r20, TICK
    LOAD r14, r20           ; r14 = tick
    ADD r14, r9             ; r14 = tick + 1
    STORE r20, r14          ; tick++

    ; Compute phase = tick % 200
    LDI r15, 0
    ADD r15, r14             ; r15 = tick
    LDI r13, 200
    MOD r15, r13             ; r15 = tick % 200 (0..199)

    ; Triangle wave from phase:
    ;   if phase < 100: bar_width = phase (ramp up)
    ;   if phase >= 100: bar_width = 200 - phase (ramp down)
    ; CMPI sets r12: 0xFFFFFFFF if <, 0 if ==, 1 if >
    ; BGE branches when r12 != 0xFFFFFFFF (i.e., >= )
    CMPI r15, 100
    BGE r12, ramp_down       ; if phase >= 100, go to ramp_down

    ; ramp up: bar_width = phase
    LDI r7, 0
    ADD r7, r15             ; r7 = phase (0..99)
    JMP store_width

ramp_down:
    ; ramp down: bar_width = 200 - phase
    LDI r3, 200
    LDI r7, 0
    ADD r7, r15             ; r7 = phase
    SUB r3, r7             ; r3 = 200 - phase
    LDI r7, 0
    ADD r7, r3             ; r7 = bar_width

store_width:
    LDI r20, BAR_W
    STORE r20, r7          ; save bar_width to RAM

    ; ── DRAW ──

    ; Clear screen to dark blue-black
    LDI r3, 0x0D0D1A
    FILL r3

    ; Draw bar: filled rectangle at (78, 100) with width=bar_width, height=30
    ; Color cycles: use tick to shift hue
    ; Simple: alternate between two colors based on tick/50
    LDI r20, TICK
    LOAD r14, r20           ; r14 = tick
    LDI r13, 50
    LDI r3, 0
    ADD r3, r14
    MOD r3, r13             ; r3 = tick % 50

    ; Color: 0x2ECC71 (green) base, shift with tick
    ; r8 = 0x2ECC71 + (tick % 50) * small_offset
    ; Simpler: just use tick low bits to cycle RGB
    LDI r8, 0x2ECC71       ; base green
    ADD r8, r14             ; shift color with tick (wraps around nicely)

    ; Bar position: x=78, y=100, w=bar_width, h=30
    LDI r9, 78             ; x
    LDI r3, 100            ; y
    LDI r14, 0
    ADD r14, r7             ; w = bar_width (from above)
    LDI r11, 30             ; h
    RECTF r9, r3, r14, r11, r8

    ; Draw "PULSE" title text
    LDI r20, SCRATCH       ; scratch buffer
    LDI r3, 80             ; 'P'
    STORE r20, r3
    LDI r9, 1
    ADD r20, r9
    LDI r3, 85             ; 'U'
    STORE r20, r3
    ADD r20, r9
    LDI r3, 76             ; 'L'
    STORE r20, r3
    ADD r20, r9
    LDI r3, 83             ; 'S'
    STORE r20, r3
    ADD r20, r9
    LDI r3, 69             ; 'E'
    STORE r20, r3
    ADD r20, r9
    LDI r3, 0              ; null terminator
    STORE r20, r3

    LDI r9, 5
    LDI r3, 5
    LDI r14, SCRATCH
    TEXT r9, r3, r14

    ; Draw frame counter as 3-digit number at (5, 20)
    LDI r20, SCRATCH
    LDI r20, TICK
    LOAD r2, r20          ; r2 = tick value

    ; Convert tick to 3 ASCII digits at 0x200
    LDI r9, 1
    LDI r20, SCRATCH

    ; Hundreds
    LDI r7, 100
    LDI r1, 0
    ADD r1, r2
    DIV r1, r7            ; r1 = hundreds
    LDI r3, 48
    ADD r3, r1
    STORE r20, r3
    ADD r20, r9

    ; Tens
    LDI r0, 0
    ADD r0, r1
    LDI r3, 100
    MUL r0, r3            ; r0 = hundreds * 100
    LDI r4, 0
    ADD r4, r2
    SUB r4, r0           ; r4 = remainder
    LDI r7, 10
    LDI r10, 0
    ADD r10, r4
    DIV r10, r7            ; r10 = tens
    LDI r3, 48
    ADD r3, r10
    STORE r20, r3
    ADD r20, r9

    ; Ones
    LDI r5, 0
    ADD r5, r4
    LDI r7, 10
    MOD r5, r7            ; r5 = ones
    LDI r3, 48
    ADD r3, r5
    STORE r20, r3
    ADD r20, r9
    LDI r3, 0
    STORE r20, r3          ; null terminate

    LDI r9, 5
    LDI r3, 20
    LDI r14, SCRATCH
    TEXT r9, r3, r14

    ; ── FRAME ──
    FRAME

    JMP main_loop
