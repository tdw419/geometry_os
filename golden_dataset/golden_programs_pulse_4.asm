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
;   r8  - constant 1
;   r2  - scratch
;   r7  - scratch (tick, temp)
;   r11  - color
;   r15  - bar width
;   r5  - divisor/modulus (200, 100)
;   r3  - phase (tick % 200)
;   r14  - frame_count from RAM[0xFFE]
;

#define TICK      0x200
#define BAR_W     0x204
#define SCRATCH   0x300
#define FCOUNT    0xFFE

; ── INIT ──────────────────────────────────────
LDI r8, 1

; tick = 0
LDI r2, TICK
LDI r7, 0
STORE r2, r7

; bar_width = 0
LDI r2, BAR_W
LDI r7, 0
STORE r2, r7

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r8, 1

    ; ── UPDATE STATE ──

    ; Increment tick
    LDI r20, TICK
    LOAD r7, r20           ; r7 = tick
    ADD r7, r8             ; r7 = tick + 1
    STORE r20, r7          ; tick++

    ; Compute phase = tick % 200
    LDI r3, 0
    ADD r3, r7             ; r3 = tick
    LDI r5, 200
    MOD r3, r5             ; r3 = tick % 200 (0..199)

    ; Triangle wave from phase:
    ;   if phase < 100: bar_width = phase (ramp up)
    ;   if phase >= 100: bar_width = 200 - phase (ramp down)
    ; CMPI sets r6: 0xFFFFFFFF if <, 0 if ==, 1 if >
    ; BGE branches when r6 != 0xFFFFFFFF (i.e., >= )
    CMPI r3, 100
    BGE r6, ramp_down       ; if phase >= 100, go to ramp_down

    ; ramp up: bar_width = phase
    LDI r15, 0
    ADD r15, r3             ; r15 = phase (0..99)
    JMP store_width

ramp_down:
    ; ramp down: bar_width = 200 - phase
    LDI r2, 200
    LDI r15, 0
    ADD r15, r3             ; r15 = phase
    SUB r2, r15             ; r2 = 200 - phase
    LDI r15, 0
    ADD r15, r2             ; r15 = bar_width

store_width:
    LDI r20, BAR_W
    STORE r20, r15          ; save bar_width to RAM

    ; ── DRAW ──

    ; Clear screen to dark blue-black
    LDI r2, 0x0D0D1A
    FILL r2

    ; Draw bar: filled rectangle at (78, 100) with width=bar_width, height=30
    ; Color cycles: use tick to shift hue
    ; Simple: alternate between two colors based on tick/50
    LDI r20, TICK
    LOAD r7, r20           ; r7 = tick
    LDI r5, 50
    LDI r2, 0
    ADD r2, r7
    MOD r2, r5             ; r2 = tick % 50

    ; Color: 0x2ECC71 (green) base, shift with tick
    ; r11 = 0x2ECC71 + (tick % 50) * small_offset
    ; Simpler: just use tick low bits to cycle RGB
    LDI r11, 0x2ECC71       ; base green
    ADD r11, r7             ; shift color with tick (wraps around nicely)

    ; Bar position: x=78, y=100, w=bar_width, h=30
    LDI r8, 78             ; x
    LDI r2, 100            ; y
    LDI r7, 0
    ADD r7, r15             ; w = bar_width (from above)
    LDI r0, 30             ; h
    RECTF r8, r2, r7, r0, r11

    ; Draw "PULSE" title text
    LDI r20, SCRATCH       ; scratch buffer
    LDI r2, 80             ; 'P'
    STORE r20, r2
    LDI r8, 1
    ADD r20, r8
    LDI r2, 85             ; 'U'
    STORE r20, r2
    ADD r20, r8
    LDI r2, 76             ; 'L'
    STORE r20, r2
    ADD r20, r8
    LDI r2, 83             ; 'S'
    STORE r20, r2
    ADD r20, r8
    LDI r2, 69             ; 'E'
    STORE r20, r2
    ADD r20, r8
    LDI r2, 0              ; null terminator
    STORE r20, r2

    LDI r8, 5
    LDI r2, 5
    LDI r7, SCRATCH
    TEXT r8, r2, r7

    ; Draw frame counter as 3-digit number at (5, 20)
    LDI r20, SCRATCH
    LDI r20, TICK
    LOAD r10, r20          ; r10 = tick value

    ; Convert tick to 3 ASCII digits at 0x200
    LDI r8, 1
    LDI r20, SCRATCH

    ; Hundreds
    LDI r15, 100
    LDI r13, 0
    ADD r13, r10
    DIV r13, r15            ; r13 = hundreds
    LDI r2, 48
    ADD r2, r13
    STORE r20, r2
    ADD r20, r8

    ; Tens
    LDI r1, 0
    ADD r1, r13
    LDI r2, 100
    MUL r1, r2            ; r1 = hundreds * 100
    LDI r4, 0
    ADD r4, r10
    SUB r4, r1           ; r4 = remainder
    LDI r15, 10
    LDI r12, 0
    ADD r12, r4
    DIV r12, r15            ; r12 = tens
    LDI r2, 48
    ADD r2, r12
    STORE r20, r2
    ADD r20, r8

    ; Ones
    LDI r9, 0
    ADD r9, r4
    LDI r15, 10
    MOD r9, r15            ; r9 = ones
    LDI r2, 48
    ADD r2, r9
    STORE r20, r2
    ADD r20, r8
    LDI r2, 0
    STORE r20, r2          ; null terminate

    LDI r8, 5
    LDI r2, 20
    LDI r7, SCRATCH
    TEXT r8, r2, r7

    ; ── FRAME ──
    FRAME

    JMP main_loop
