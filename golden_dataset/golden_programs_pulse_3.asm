; DESCRIPTION: This GeOS assembly code implements a self-animating pulse bar that continuously grows and shrinks in width, cycling indefinitely without external input. The animation is driven by a frame-based timer, with the bar's width modulated using a triangle wave pattern. Additionally, the color of the bar shifts based on the current tick count to provide visual feedback. The code also displays the "PULSE" title text and the current frame count on the screen.

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
;   r5  - constant 1
;   r4  - scratch
;   r15  - scratch (tick, temp)
;   r8  - color
;   r2  - bar width
;   r14  - divisor/modulus (200, 100)
;   r3  - phase (tick % 200)
;   r7  - frame_count from RAM[0xFFE]
;

#define TICK      0x200
#define BAR_W     0x204
#define SCRATCH   0x300
#define FCOUNT    0xFFE

; ── INIT ──────────────────────────────────────
LDI r5, 1

; tick = 0
LDI r4, TICK
LDI r15, 0
STORE r4, r15

; bar_width = 0
LDI r4, BAR_W
LDI r15, 0
STORE r4, r15

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r5, 1

    ; ── UPDATE STATE ──

    ; Increment tick
    LDI r20, TICK
    LOAD r15, r20           ; r15 = tick
    ADD r15, r5             ; r15 = tick + 1
    STORE r20, r15          ; tick++

    ; Compute phase = tick % 200
    LDI r3, 0
    ADD r3, r15             ; r3 = tick
    LDI r14, 200
    MOD r3, r14             ; r3 = tick % 200 (0..199)

    ; Triangle wave from phase:
    ;   if phase < 100: bar_width = phase (ramp up)
    ;   if phase >= 100: bar_width = 200 - phase (ramp down)
    ; CMPI sets r11: 0xFFFFFFFF if <, 0 if ==, 1 if >
    ; BGE branches when r11 != 0xFFFFFFFF (i.e., >= )
    CMPI r3, 100
    BGE r11, ramp_down       ; if phase >= 100, go to ramp_down

    ; ramp up: bar_width = phase
    LDI r2, 0
    ADD r2, r3             ; r2 = phase (0..99)
    JMP store_width

ramp_down:
    ; ramp down: bar_width = 200 - phase
    LDI r4, 200
    LDI r2, 0
    ADD r2, r3             ; r2 = phase
    SUB r4, r2             ; r4 = 200 - phase
    LDI r2, 0
    ADD r2, r4             ; r2 = bar_width

store_width:
    LDI r20, BAR_W
    STORE r20, r2          ; save bar_width to RAM

    ; ── DRAW ──

    ; Clear screen to dark blue-black
    LDI r4, 0x0D0D1A
    FILL r4

    ; Draw bar: filled rectangle at (78, 100) with width=bar_width, height=30
    ; Color cycles: use tick to shift hue
    ; Simple: alternate between two colors based on tick/50
    LDI r20, TICK
    LOAD r15, r20           ; r15 = tick
    LDI r14, 50
    LDI r4, 0
    ADD r4, r15
    MOD r4, r14             ; r4 = tick % 50

    ; Color: 0x2ECC71 (green) base, shift with tick
    ; r8 = 0x2ECC71 + (tick % 50) * small_offset
    ; Simpler: just use tick low bits to cycle RGB
    LDI r8, 0x2ECC71       ; base green
    ADD r8, r15             ; shift color with tick (wraps around nicely)

    ; Bar position: x=78, y=100, w=bar_width, h=30
    LDI r5, 78             ; x
    LDI r4, 100            ; y
    LDI r15, 0
    ADD r15, r2             ; w = bar_width (from above)
    LDI r6, 30             ; h
    RECTF r5, r4, r15, r6, r8

    ; Draw "PULSE" title text
    LDI r20, SCRATCH       ; scratch buffer
    LDI r4, 80             ; 'P'
    STORE r20, r4
    LDI r5, 1
    ADD r20, r5
    LDI r4, 85             ; 'U'
    STORE r20, r4
    ADD r20, r5
    LDI r4, 76             ; 'L'
    STORE r20, r4
    ADD r20, r5
    LDI r4, 83             ; 'S'
    STORE r20, r4
    ADD r20, r5
    LDI r4, 69             ; 'E'
    STORE r20, r4
    ADD r20, r5
    LDI r4, 0              ; null terminator
    STORE r20, r4

    LDI r5, 5
    LDI r4, 5
    LDI r15, SCRATCH
    TEXT r5, r4, r15

    ; Draw frame counter as 3-digit number at (5, 20)
    LDI r20, SCRATCH
    LDI r20, TICK
    LOAD r0, r20          ; r0 = tick value

    ; Convert tick to 3 ASCII digits at 0x200
    LDI r5, 1
    LDI r20, SCRATCH

    ; Hundreds
    LDI r2, 100
    LDI r10, 0
    ADD r10, r0
    DIV r10, r2            ; r10 = hundreds
    LDI r4, 48
    ADD r4, r10
    STORE r20, r4
    ADD r20, r5

    ; Tens
    LDI r13, 0
    ADD r13, r10
    LDI r4, 100
    MUL r13, r4            ; r13 = hundreds * 100
    LDI r12, 0
    ADD r12, r0
    SUB r12, r13           ; r12 = remainder
    LDI r2, 10
    LDI r1, 0
    ADD r1, r12
    DIV r1, r2            ; r1 = tens
    LDI r4, 48
    ADD r4, r1
    STORE r20, r4
    ADD r20, r5

    ; Ones
    LDI r9, 0
    ADD r9, r12
    LDI r2, 10
    MOD r9, r2            ; r9 = ones
    LDI r4, 48
    ADD r4, r9
    STORE r20, r4
    ADD r20, r5
    LDI r4, 0
    STORE r20, r4          ; null terminate

    LDI r5, 5
    LDI r4, 20
    LDI r15, SCRATCH
    TEXT r5, r4, r15

    ; ── FRAME ──
    FRAME

    JMP main_loop
