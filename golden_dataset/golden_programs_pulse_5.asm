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
;   r10  - constant 1
;   r3  - scratch
;   r7  - scratch (tick, temp)
;   r5  - color
;   r11  - bar width
;   r13  - divisor/modulus (200, 100)
;   r14  - phase (tick % 200)
;   r6  - frame_count from RAM[0xFFE]
;

#define TICK      0x200
#define BAR_W     0x204
#define SCRATCH   0x300
#define FCOUNT    0xFFE

; ── INIT ──────────────────────────────────────
LDI r10, 1

; tick = 0
LDI r3, TICK
LDI r7, 0
STORE r3, r7

; bar_width = 0
LDI r3, BAR_W
LDI r7, 0
STORE r3, r7

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r10, 1

    ; ── UPDATE STATE ──

    ; Increment tick
    LDI r20, TICK
    LOAD r7, r20           ; r7 = tick
    ADD r7, r10             ; r7 = tick + 1
    STORE r20, r7          ; tick++

    ; Compute phase = tick % 200
    LDI r14, 0
    ADD r14, r7             ; r14 = tick
    LDI r13, 200
    MOD r14, r13             ; r14 = tick % 200 (0..199)

    ; Triangle wave from phase:
    ;   if phase < 100: bar_width = phase (ramp up)
    ;   if phase >= 100: bar_width = 200 - phase (ramp down)
    ; CMPI sets r12: 0xFFFFFFFF if <, 0 if ==, 1 if >
    ; BGE branches when r12 != 0xFFFFFFFF (i.e., >= )
    CMPI r14, 100
    BGE r12, ramp_down       ; if phase >= 100, go to ramp_down

    ; ramp up: bar_width = phase
    LDI r11, 0
    ADD r11, r14             ; r11 = phase (0..99)
    JMP store_width

ramp_down:
    ; ramp down: bar_width = 200 - phase
    LDI r3, 200
    LDI r11, 0
    ADD r11, r14             ; r11 = phase
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
    LOAD r7, r20           ; r7 = tick
    LDI r13, 50
    LDI r3, 0
    ADD r3, r7
    MOD r3, r13             ; r3 = tick % 50

    ; Color: 0x2ECC71 (green) base, shift with tick
    ; r5 = 0x2ECC71 + (tick % 50) * small_offset
    ; Simpler: just use tick low bits to cycle RGB
    LDI r5, 0x2ECC71       ; base green
    ADD r5, r7             ; shift color with tick (wraps around nicely)

    ; Bar position: x=78, y=100, w=bar_width, h=30
    LDI r10, 78             ; x
    LDI r3, 100            ; y
    LDI r7, 0
    ADD r7, r11             ; w = bar_width (from above)
    LDI r2, 30             ; h
    RECTF r10, r3, r7, r2, r5

    ; Draw "PULSE" title text
    LDI r20, SCRATCH       ; scratch buffer
    LDI r3, 80             ; 'P'
    STORE r20, r3
    LDI r10, 1
    ADD r20, r10
    LDI r3, 85             ; 'U'
    STORE r20, r3
    ADD r20, r10
    LDI r3, 76             ; 'L'
    STORE r20, r3
    ADD r20, r10
    LDI r3, 83             ; 'S'
    STORE r20, r3
    ADD r20, r10
    LDI r3, 69             ; 'E'
    STORE r20, r3
    ADD r20, r10
    LDI r3, 0              ; null terminator
    STORE r20, r3

    LDI r10, 5
    LDI r3, 5
    LDI r7, SCRATCH
    TEXT r10, r3, r7

    ; Draw frame counter as 3-digit number at (5, 20)
    LDI r20, SCRATCH
    LDI r20, TICK
    LOAD r15, r20          ; r15 = tick value

    ; Convert tick to 3 ASCII digits at 0x200
    LDI r10, 1
    LDI r20, SCRATCH

    ; Hundreds
    LDI r11, 100
    LDI r1, 0
    ADD r1, r15
    DIV r1, r11            ; r1 = hundreds
    LDI r3, 48
    ADD r3, r1
    STORE r20, r3
    ADD r20, r10

    ; Tens
    LDI r4, 0
    ADD r4, r1
    LDI r3, 100
    MUL r4, r3            ; r4 = hundreds * 100
    LDI r9, 0
    ADD r9, r15
    SUB r9, r4           ; r9 = remainder
    LDI r11, 10
    LDI r8, 0
    ADD r8, r9
    DIV r8, r11            ; r8 = tens
    LDI r3, 48
    ADD r3, r8
    STORE r20, r3
    ADD r20, r10

    ; Ones
    LDI r0, 0
    ADD r0, r9
    LDI r11, 10
    MOD r0, r11            ; r0 = ones
    LDI r3, 48
    ADD r3, r0
    STORE r20, r3
    ADD r20, r10
    LDI r3, 0
    STORE r20, r3          ; null terminate

    LDI r10, 5
    LDI r3, 20
    LDI r7, SCRATCH
    TEXT r10, r3, r7

    ; ── FRAME ──
    FRAME

    JMP main_loop
