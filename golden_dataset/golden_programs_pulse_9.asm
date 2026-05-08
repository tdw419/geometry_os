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
;   r11  - constant 1
;   r10  - scratch
;   r8  - scratch (tick, temp)
;   r12  - color
;   r2  - bar width
;   r3  - divisor/modulus (200, 100)
;   r7  - phase (tick % 200)
;   r5  - frame_count from RAM[0xFFE]
;

#define TICK      0x200
#define BAR_W     0x204
#define SCRATCH   0x300
#define FCOUNT    0xFFE

; ── INIT ──────────────────────────────────────
LDI r11, 1

; tick = 0
LDI r10, TICK
LDI r8, 0
STORE r10, r8

; bar_width = 0
LDI r10, BAR_W
LDI r8, 0
STORE r10, r8

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r11, 1

    ; ── UPDATE STATE ──

    ; Increment tick
    LDI r20, TICK
    LOAD r8, r20           ; r8 = tick
    ADD r8, r11             ; r8 = tick + 1
    STORE r20, r8          ; tick++

    ; Compute phase = tick % 200
    LDI r7, 0
    ADD r7, r8             ; r7 = tick
    LDI r3, 200
    MOD r7, r3             ; r7 = tick % 200 (0..199)

    ; Triangle wave from phase:
    ;   if phase < 100: bar_width = phase (ramp up)
    ;   if phase >= 100: bar_width = 200 - phase (ramp down)
    ; CMPI sets r4: 0xFFFFFFFF if <, 0 if ==, 1 if >
    ; BGE branches when r4 != 0xFFFFFFFF (i.e., >= )
    CMPI r7, 100
    BGE r4, ramp_down       ; if phase >= 100, go to ramp_down

    ; ramp up: bar_width = phase
    LDI r2, 0
    ADD r2, r7             ; r2 = phase (0..99)
    JMP store_width

ramp_down:
    ; ramp down: bar_width = 200 - phase
    LDI r10, 200
    LDI r2, 0
    ADD r2, r7             ; r2 = phase
    SUB r10, r2             ; r10 = 200 - phase
    LDI r2, 0
    ADD r2, r10             ; r2 = bar_width

store_width:
    LDI r20, BAR_W
    STORE r20, r2          ; save bar_width to RAM

    ; ── DRAW ──

    ; Clear screen to dark blue-black
    LDI r10, 0x0D0D1A
    FILL r10

    ; Draw bar: filled rectangle at (78, 100) with width=bar_width, height=30
    ; Color cycles: use tick to shift hue
    ; Simple: alternate between two colors based on tick/50
    LDI r20, TICK
    LOAD r8, r20           ; r8 = tick
    LDI r3, 50
    LDI r10, 0
    ADD r10, r8
    MOD r10, r3             ; r10 = tick % 50

    ; Color: 0x2ECC71 (green) base, shift with tick
    ; r12 = 0x2ECC71 + (tick % 50) * small_offset
    ; Simpler: just use tick low bits to cycle RGB
    LDI r12, 0x2ECC71       ; base green
    ADD r12, r8             ; shift color with tick (wraps around nicely)

    ; Bar position: x=78, y=100, w=bar_width, h=30
    LDI r11, 78             ; x
    LDI r10, 100            ; y
    LDI r8, 0
    ADD r8, r2             ; w = bar_width (from above)
    LDI r0, 30             ; h
    RECTF r11, r10, r8, r0, r12

    ; Draw "PULSE" title text
    LDI r20, SCRATCH       ; scratch buffer
    LDI r10, 80             ; 'P'
    STORE r20, r10
    LDI r11, 1
    ADD r20, r11
    LDI r10, 85             ; 'U'
    STORE r20, r10
    ADD r20, r11
    LDI r10, 76             ; 'L'
    STORE r20, r10
    ADD r20, r11
    LDI r10, 83             ; 'S'
    STORE r20, r10
    ADD r20, r11
    LDI r10, 69             ; 'E'
    STORE r20, r10
    ADD r20, r11
    LDI r10, 0              ; null terminator
    STORE r20, r10

    LDI r11, 5
    LDI r10, 5
    LDI r8, SCRATCH
    TEXT r11, r10, r8

    ; Draw frame counter as 3-digit number at (5, 20)
    LDI r20, SCRATCH
    LDI r20, TICK
    LOAD r6, r20          ; r6 = tick value

    ; Convert tick to 3 ASCII digits at 0x200
    LDI r11, 1
    LDI r20, SCRATCH

    ; Hundreds
    LDI r2, 100
    LDI r9, 0
    ADD r9, r6
    DIV r9, r2            ; r9 = hundreds
    LDI r10, 48
    ADD r10, r9
    STORE r20, r10
    ADD r20, r11

    ; Tens
    LDI r13, 0
    ADD r13, r9
    LDI r10, 100
    MUL r13, r10            ; r13 = hundreds * 100
    LDI r14, 0
    ADD r14, r6
    SUB r14, r13           ; r14 = remainder
    LDI r2, 10
    LDI r1, 0
    ADD r1, r14
    DIV r1, r2            ; r1 = tens
    LDI r10, 48
    ADD r10, r1
    STORE r20, r10
    ADD r20, r11

    ; Ones
    LDI r15, 0
    ADD r15, r14
    LDI r2, 10
    MOD r15, r2            ; r15 = ones
    LDI r10, 48
    ADD r10, r15
    STORE r20, r10
    ADD r20, r11
    LDI r10, 0
    STORE r20, r10          ; null terminate

    LDI r11, 5
    LDI r10, 20
    LDI r8, SCRATCH
    TEXT r11, r10, r8

    ; ── FRAME ──
    FRAME

    JMP main_loop
