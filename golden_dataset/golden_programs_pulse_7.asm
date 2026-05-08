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
;   r14  - scratch
;   r8  - scratch (tick, temp)
;   r13  - color
;   r7  - bar width
;   r12  - divisor/modulus (200, 100)
;   r4  - phase (tick % 200)
;   r5  - frame_count from RAM[0xFFE]
;

#define TICK      0x200
#define BAR_W     0x204
#define SCRATCH   0x300
#define FCOUNT    0xFFE

; ── INIT ──────────────────────────────────────
LDI r9, 1

; tick = 0
LDI r14, TICK
LDI r8, 0
STORE r14, r8

; bar_width = 0
LDI r14, BAR_W
LDI r8, 0
STORE r14, r8

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r9, 1

    ; ── UPDATE STATE ──

    ; Increment tick
    LDI r20, TICK
    LOAD r8, r20           ; r8 = tick
    ADD r8, r9             ; r8 = tick + 1
    STORE r20, r8          ; tick++

    ; Compute phase = tick % 200
    LDI r4, 0
    ADD r4, r8             ; r4 = tick
    LDI r12, 200
    MOD r4, r12             ; r4 = tick % 200 (0..199)

    ; Triangle wave from phase:
    ;   if phase < 100: bar_width = phase (ramp up)
    ;   if phase >= 100: bar_width = 200 - phase (ramp down)
    ; CMPI sets r15: 0xFFFFFFFF if <, 0 if ==, 1 if >
    ; BGE branches when r15 != 0xFFFFFFFF (i.e., >= )
    CMPI r4, 100
    BGE r15, ramp_down       ; if phase >= 100, go to ramp_down

    ; ramp up: bar_width = phase
    LDI r7, 0
    ADD r7, r4             ; r7 = phase (0..99)
    JMP store_width

ramp_down:
    ; ramp down: bar_width = 200 - phase
    LDI r14, 200
    LDI r7, 0
    ADD r7, r4             ; r7 = phase
    SUB r14, r7             ; r14 = 200 - phase
    LDI r7, 0
    ADD r7, r14             ; r7 = bar_width

store_width:
    LDI r20, BAR_W
    STORE r20, r7          ; save bar_width to RAM

    ; ── DRAW ──

    ; Clear screen to dark blue-black
    LDI r14, 0x0D0D1A
    FILL r14

    ; Draw bar: filled rectangle at (78, 100) with width=bar_width, height=30
    ; Color cycles: use tick to shift hue
    ; Simple: alternate between two colors based on tick/50
    LDI r20, TICK
    LOAD r8, r20           ; r8 = tick
    LDI r12, 50
    LDI r14, 0
    ADD r14, r8
    MOD r14, r12             ; r14 = tick % 50

    ; Color: 0x2ECC71 (green) base, shift with tick
    ; r13 = 0x2ECC71 + (tick % 50) * small_offset
    ; Simpler: just use tick low bits to cycle RGB
    LDI r13, 0x2ECC71       ; base green
    ADD r13, r8             ; shift color with tick (wraps around nicely)

    ; Bar position: x=78, y=100, w=bar_width, h=30
    LDI r9, 78             ; x
    LDI r14, 100            ; y
    LDI r8, 0
    ADD r8, r7             ; w = bar_width (from above)
    LDI r0, 30             ; h
    RECTF r9, r14, r8, r0, r13

    ; Draw "PULSE" title text
    LDI r20, SCRATCH       ; scratch buffer
    LDI r14, 80             ; 'P'
    STORE r20, r14
    LDI r9, 1
    ADD r20, r9
    LDI r14, 85             ; 'U'
    STORE r20, r14
    ADD r20, r9
    LDI r14, 76             ; 'L'
    STORE r20, r14
    ADD r20, r9
    LDI r14, 83             ; 'S'
    STORE r20, r14
    ADD r20, r9
    LDI r14, 69             ; 'E'
    STORE r20, r14
    ADD r20, r9
    LDI r14, 0              ; null terminator
    STORE r20, r14

    LDI r9, 5
    LDI r14, 5
    LDI r8, SCRATCH
    TEXT r9, r14, r8

    ; Draw frame counter as 3-digit number at (5, 20)
    LDI r20, SCRATCH
    LDI r20, TICK
    LOAD r3, r20          ; r3 = tick value

    ; Convert tick to 3 ASCII digits at 0x200
    LDI r9, 1
    LDI r20, SCRATCH

    ; Hundreds
    LDI r7, 100
    LDI r6, 0
    ADD r6, r3
    DIV r6, r7            ; r6 = hundreds
    LDI r14, 48
    ADD r14, r6
    STORE r20, r14
    ADD r20, r9

    ; Tens
    LDI r10, 0
    ADD r10, r6
    LDI r14, 100
    MUL r10, r14            ; r10 = hundreds * 100
    LDI r2, 0
    ADD r2, r3
    SUB r2, r10           ; r2 = remainder
    LDI r7, 10
    LDI r1, 0
    ADD r1, r2
    DIV r1, r7            ; r1 = tens
    LDI r14, 48
    ADD r14, r1
    STORE r20, r14
    ADD r20, r9

    ; Ones
    LDI r11, 0
    ADD r11, r2
    LDI r7, 10
    MOD r11, r7            ; r11 = ones
    LDI r14, 48
    ADD r14, r11
    STORE r20, r14
    ADD r20, r9
    LDI r14, 0
    STORE r20, r14          ; null terminate

    LDI r9, 5
    LDI r14, 20
    LDI r8, SCRATCH
    TEXT r9, r14, r8

    ; ── FRAME ──
    FRAME

    JMP main_loop
