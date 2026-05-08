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
;   r2  - constant 1
;   r3  - scratch
;   r4  - scratch (tick, temp)
;   r15  - color
;   r8  - bar width
;   r12  - divisor/modulus (200, 100)
;   r7  - phase (tick % 200)
;   r6  - frame_count from RAM[0xFFE]
;

#define TICK      0x200
#define BAR_W     0x204
#define SCRATCH   0x300
#define FCOUNT    0xFFE

; ── INIT ──────────────────────────────────────
LDI r2, 1

; tick = 0
LDI r3, TICK
LDI r4, 0
STORE r3, r4

; bar_width = 0
LDI r3, BAR_W
LDI r4, 0
STORE r3, r4

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r2, 1

    ; ── UPDATE STATE ──

    ; Increment tick
    LDI r20, TICK
    LOAD r4, r20           ; r4 = tick
    ADD r4, r2             ; r4 = tick + 1
    STORE r20, r4          ; tick++

    ; Compute phase = tick % 200
    LDI r7, 0
    ADD r7, r4             ; r7 = tick
    LDI r12, 200
    MOD r7, r12             ; r7 = tick % 200 (0..199)

    ; Triangle wave from phase:
    ;   if phase < 100: bar_width = phase (ramp up)
    ;   if phase >= 100: bar_width = 200 - phase (ramp down)
    ; CMPI sets r1: 0xFFFFFFFF if <, 0 if ==, 1 if >
    ; BGE branches when r1 != 0xFFFFFFFF (i.e., >= )
    CMPI r7, 100
    BGE r1, ramp_down       ; if phase >= 100, go to ramp_down

    ; ramp up: bar_width = phase
    LDI r8, 0
    ADD r8, r7             ; r8 = phase (0..99)
    JMP store_width

ramp_down:
    ; ramp down: bar_width = 200 - phase
    LDI r3, 200
    LDI r8, 0
    ADD r8, r7             ; r8 = phase
    SUB r3, r8             ; r3 = 200 - phase
    LDI r8, 0
    ADD r8, r3             ; r8 = bar_width

store_width:
    LDI r20, BAR_W
    STORE r20, r8          ; save bar_width to RAM

    ; ── DRAW ──

    ; Clear screen to dark blue-black
    LDI r3, 0x0D0D1A
    FILL r3

    ; Draw bar: filled rectangle at (78, 100) with width=bar_width, height=30
    ; Color cycles: use tick to shift hue
    ; Simple: alternate between two colors based on tick/50
    LDI r20, TICK
    LOAD r4, r20           ; r4 = tick
    LDI r12, 50
    LDI r3, 0
    ADD r3, r4
    MOD r3, r12             ; r3 = tick % 50

    ; Color: 0x2ECC71 (green) base, shift with tick
    ; r15 = 0x2ECC71 + (tick % 50) * small_offset
    ; Simpler: just use tick low bits to cycle RGB
    LDI r15, 0x2ECC71       ; base green
    ADD r15, r4             ; shift color with tick (wraps around nicely)

    ; Bar position: x=78, y=100, w=bar_width, h=30
    LDI r2, 78             ; x
    LDI r3, 100            ; y
    LDI r4, 0
    ADD r4, r8             ; w = bar_width (from above)
    LDI r9, 30             ; h
    RECTF r2, r3, r4, r9, r15

    ; Draw "PULSE" title text
    LDI r20, SCRATCH       ; scratch buffer
    LDI r3, 80             ; 'P'
    STORE r20, r3
    LDI r2, 1
    ADD r20, r2
    LDI r3, 85             ; 'U'
    STORE r20, r3
    ADD r20, r2
    LDI r3, 76             ; 'L'
    STORE r20, r3
    ADD r20, r2
    LDI r3, 83             ; 'S'
    STORE r20, r3
    ADD r20, r2
    LDI r3, 69             ; 'E'
    STORE r20, r3
    ADD r20, r2
    LDI r3, 0              ; null terminator
    STORE r20, r3

    LDI r2, 5
    LDI r3, 5
    LDI r4, SCRATCH
    TEXT r2, r3, r4

    ; Draw frame counter as 3-digit number at (5, 20)
    LDI r20, SCRATCH
    LDI r20, TICK
    LOAD r10, r20          ; r10 = tick value

    ; Convert tick to 3 ASCII digits at 0x200
    LDI r2, 1
    LDI r20, SCRATCH

    ; Hundreds
    LDI r8, 100
    LDI r14, 0
    ADD r14, r10
    DIV r14, r8            ; r14 = hundreds
    LDI r3, 48
    ADD r3, r14
    STORE r20, r3
    ADD r20, r2

    ; Tens
    LDI r0, 0
    ADD r0, r14
    LDI r3, 100
    MUL r0, r3            ; r0 = hundreds * 100
    LDI r13, 0
    ADD r13, r10
    SUB r13, r0           ; r13 = remainder
    LDI r8, 10
    LDI r5, 0
    ADD r5, r13
    DIV r5, r8            ; r5 = tens
    LDI r3, 48
    ADD r3, r5
    STORE r20, r3
    ADD r20, r2

    ; Ones
    LDI r11, 0
    ADD r11, r13
    LDI r8, 10
    MOD r11, r8            ; r11 = ones
    LDI r3, 48
    ADD r3, r11
    STORE r20, r3
    ADD r20, r2
    LDI r3, 0
    STORE r20, r3          ; null terminate

    LDI r2, 5
    LDI r3, 20
    LDI r4, SCRATCH
    TEXT r2, r3, r4

    ; ── FRAME ──
    FRAME

    JMP main_loop
