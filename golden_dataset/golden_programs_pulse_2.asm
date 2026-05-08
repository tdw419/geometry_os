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
;   r9  - constant 1
;   r8  - scratch
;   r12  - scratch (tick, temp)
;   r7  - color
;   r4  - bar width
;   r2  - divisor/modulus (200, 100)
;   r14  - phase (tick % 200)
;   r0  - frame_count from RAM[0xFFE]
;

#define TICK      0x200
#define BAR_W     0x204
#define SCRATCH   0x300
#define FCOUNT    0xFFE

; ── INIT ──────────────────────────────────────
LDI r9, 1

; tick = 0
LDI r8, TICK
LDI r12, 0
STORE r8, r12

; bar_width = 0
LDI r8, BAR_W
LDI r12, 0
STORE r8, r12

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r9, 1

    ; ── UPDATE STATE ──

    ; Increment tick
    LDI r20, TICK
    LOAD r12, r20           ; r12 = tick
    ADD r12, r9             ; r12 = tick + 1
    STORE r20, r12          ; tick++

    ; Compute phase = tick % 200
    LDI r14, 0
    ADD r14, r12             ; r14 = tick
    LDI r2, 200
    MOD r14, r2             ; r14 = tick % 200 (0..199)

    ; Triangle wave from phase:
    ;   if phase < 100: bar_width = phase (ramp up)
    ;   if phase >= 100: bar_width = 200 - phase (ramp down)
    ; CMPI sets r6: 0xFFFFFFFF if <, 0 if ==, 1 if >
    ; BGE branches when r6 != 0xFFFFFFFF (i.e., >= )
    CMPI r14, 100
    BGE r6, ramp_down       ; if phase >= 100, go to ramp_down

    ; ramp up: bar_width = phase
    LDI r4, 0
    ADD r4, r14             ; r4 = phase (0..99)
    JMP store_width

ramp_down:
    ; ramp down: bar_width = 200 - phase
    LDI r8, 200
    LDI r4, 0
    ADD r4, r14             ; r4 = phase
    SUB r8, r4             ; r8 = 200 - phase
    LDI r4, 0
    ADD r4, r8             ; r4 = bar_width

store_width:
    LDI r20, BAR_W
    STORE r20, r4          ; save bar_width to RAM

    ; ── DRAW ──

    ; Clear screen to dark blue-black
    LDI r8, 0x0D0D1A
    FILL r8

    ; Draw bar: filled rectangle at (78, 100) with width=bar_width, height=30
    ; Color cycles: use tick to shift hue
    ; Simple: alternate between two colors based on tick/50
    LDI r20, TICK
    LOAD r12, r20           ; r12 = tick
    LDI r2, 50
    LDI r8, 0
    ADD r8, r12
    MOD r8, r2             ; r8 = tick % 50

    ; Color: 0x2ECC71 (green) base, shift with tick
    ; r7 = 0x2ECC71 + (tick % 50) * small_offset
    ; Simpler: just use tick low bits to cycle RGB
    LDI r7, 0x2ECC71       ; base green
    ADD r7, r12             ; shift color with tick (wraps around nicely)

    ; Bar position: x=78, y=100, w=bar_width, h=30
    LDI r9, 78             ; x
    LDI r8, 100            ; y
    LDI r12, 0
    ADD r12, r4             ; w = bar_width (from above)
    LDI r11, 30             ; h
    RECTF r9, r8, r12, r11, r7

    ; Draw "PULSE" title text
    LDI r20, SCRATCH       ; scratch buffer
    LDI r8, 80             ; 'P'
    STORE r20, r8
    LDI r9, 1
    ADD r20, r9
    LDI r8, 85             ; 'U'
    STORE r20, r8
    ADD r20, r9
    LDI r8, 76             ; 'L'
    STORE r20, r8
    ADD r20, r9
    LDI r8, 83             ; 'S'
    STORE r20, r8
    ADD r20, r9
    LDI r8, 69             ; 'E'
    STORE r20, r8
    ADD r20, r9
    LDI r8, 0              ; null terminator
    STORE r20, r8

    LDI r9, 5
    LDI r8, 5
    LDI r12, SCRATCH
    TEXT r9, r8, r12

    ; Draw frame counter as 3-digit number at (5, 20)
    LDI r20, SCRATCH
    LDI r20, TICK
    LOAD r15, r20          ; r15 = tick value

    ; Convert tick to 3 ASCII digits at 0x200
    LDI r9, 1
    LDI r20, SCRATCH

    ; Hundreds
    LDI r4, 100
    LDI r3, 0
    ADD r3, r15
    DIV r3, r4            ; r3 = hundreds
    LDI r8, 48
    ADD r8, r3
    STORE r20, r8
    ADD r20, r9

    ; Tens
    LDI r13, 0
    ADD r13, r3
    LDI r8, 100
    MUL r13, r8            ; r13 = hundreds * 100
    LDI r5, 0
    ADD r5, r15
    SUB r5, r13           ; r5 = remainder
    LDI r4, 10
    LDI r1, 0
    ADD r1, r5
    DIV r1, r4            ; r1 = tens
    LDI r8, 48
    ADD r8, r1
    STORE r20, r8
    ADD r20, r9

    ; Ones
    LDI r10, 0
    ADD r10, r5
    LDI r4, 10
    MOD r10, r4            ; r10 = ones
    LDI r8, 48
    ADD r8, r10
    STORE r20, r8
    ADD r20, r9
    LDI r8, 0
    STORE r20, r8          ; null terminate

    LDI r9, 5
    LDI r8, 20
    LDI r12, SCRATCH
    TEXT r9, r8, r12

    ; ── FRAME ──
    FRAME

    JMP main_loop
