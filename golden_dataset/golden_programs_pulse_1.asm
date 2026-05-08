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
;   r3  - scratch
;   r10  - scratch (tick, temp)
;   r14  - color
;   r11  - bar width
;   r12  - divisor/modulus (200, 100)
;   r4  - phase (tick % 200)
;   r9  - frame_count from RAM[0xFFE]
;

#define TICK      0x200
#define BAR_W     0x204
#define SCRATCH   0x300
#define FCOUNT    0xFFE

; ── INIT ──────────────────────────────────────
LDI r5, 1

; tick = 0
LDI r3, TICK
LDI r10, 0
STORE r3, r10

; bar_width = 0
LDI r3, BAR_W
LDI r10, 0
STORE r3, r10

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r5, 1

    ; ── UPDATE STATE ──

    ; Increment tick
    LDI r20, TICK
    LOAD r10, r20           ; r10 = tick
    ADD r10, r5             ; r10 = tick + 1
    STORE r20, r10          ; tick++

    ; Compute phase = tick % 200
    LDI r4, 0
    ADD r4, r10             ; r4 = tick
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
    LDI r11, 0
    ADD r11, r4             ; r11 = phase (0..99)
    JMP store_width

ramp_down:
    ; ramp down: bar_width = 200 - phase
    LDI r3, 200
    LDI r11, 0
    ADD r11, r4             ; r11 = phase
    SUB r3, r11             ; r3 = 200 - phase
    LDI r11, 0
    ADD r11, r3             ; r11 = bar_width

store_width:
    LDI r20, BAR_W
    STORE r20, r11          ; save bar_width to RAM

    ; ── DRAW ──

    ; Clear screen to dark blue-black
    LDI r3, 0x0D0D1A
    FILL r3

    ; Draw bar: filled rectangle at (78, 100) with width=bar_width, height=30
    ; Color cycles: use tick to shift hue
    ; Simple: alternate between two colors based on tick/50
    LDI r20, TICK
    LOAD r10, r20           ; r10 = tick
    LDI r12, 50
    LDI r3, 0
    ADD r3, r10
    MOD r3, r12             ; r3 = tick % 50

    ; Color: 0x2ECC71 (green) base, shift with tick
    ; r14 = 0x2ECC71 + (tick % 50) * small_offset
    ; Simpler: just use tick low bits to cycle RGB
    LDI r14, 0x2ECC71       ; base green
    ADD r14, r10             ; shift color with tick (wraps around nicely)

    ; Bar position: x=78, y=100, w=bar_width, h=30
    LDI r5, 78             ; x
    LDI r3, 100            ; y
    LDI r10, 0
    ADD r10, r11             ; w = bar_width (from above)
    LDI r7, 30             ; h
    RECTF r5, r3, r10, r7, r14

    ; Draw "PULSE" title text
    LDI r20, SCRATCH       ; scratch buffer
    LDI r3, 80             ; 'P'
    STORE r20, r3
    LDI r5, 1
    ADD r20, r5
    LDI r3, 85             ; 'U'
    STORE r20, r3
    ADD r20, r5
    LDI r3, 76             ; 'L'
    STORE r20, r3
    ADD r20, r5
    LDI r3, 83             ; 'S'
    STORE r20, r3
    ADD r20, r5
    LDI r3, 69             ; 'E'
    STORE r20, r3
    ADD r20, r5
    LDI r3, 0              ; null terminator
    STORE r20, r3

    LDI r5, 5
    LDI r3, 5
    LDI r10, SCRATCH
    TEXT r5, r3, r10

    ; Draw frame counter as 3-digit number at (5, 20)
    LDI r20, SCRATCH
    LDI r20, TICK
    LOAD r0, r20          ; r0 = tick value

    ; Convert tick to 3 ASCII digits at 0x200
    LDI r5, 1
    LDI r20, SCRATCH

    ; Hundreds
    LDI r11, 100
    LDI r13, 0
    ADD r13, r0
    DIV r13, r11            ; r13 = hundreds
    LDI r3, 48
    ADD r3, r13
    STORE r20, r3
    ADD r20, r5

    ; Tens
    LDI r6, 0
    ADD r6, r13
    LDI r3, 100
    MUL r6, r3            ; r6 = hundreds * 100
    LDI r2, 0
    ADD r2, r0
    SUB r2, r6           ; r2 = remainder
    LDI r11, 10
    LDI r1, 0
    ADD r1, r2
    DIV r1, r11            ; r1 = tens
    LDI r3, 48
    ADD r3, r1
    STORE r20, r3
    ADD r20, r5

    ; Ones
    LDI r8, 0
    ADD r8, r2
    LDI r11, 10
    MOD r8, r11            ; r8 = ones
    LDI r3, 48
    ADD r3, r8
    STORE r20, r3
    ADD r20, r5
    LDI r3, 0
    STORE r20, r3          ; null terminate

    LDI r5, 5
    LDI r3, 20
    LDI r10, SCRATCH
    TEXT r5, r3, r10

    ; ── FRAME ──
    FRAME

    JMP main_loop
