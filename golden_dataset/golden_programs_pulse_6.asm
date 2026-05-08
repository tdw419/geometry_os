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
;   r8  - constant 1
;   r7  - scratch
;   r6  - scratch (tick, temp)
;   r10  - color
;   r0  - bar width
;   r9  - divisor/modulus (200, 100)
;   r5  - phase (tick % 200)
;   r15  - frame_count from RAM[0xFFE]
;

#define TICK      0x200
#define BAR_W     0x204
#define SCRATCH   0x300
#define FCOUNT    0xFFE

; ── INIT ──────────────────────────────────────
LDI r8, 1

; tick = 0
LDI r7, TICK
LDI r6, 0
STORE r7, r6

; bar_width = 0
LDI r7, BAR_W
LDI r6, 0
STORE r7, r6

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r8, 1

    ; ── UPDATE STATE ──

    ; Increment tick
    LDI r20, TICK
    LOAD r6, r20           ; r6 = tick
    ADD r6, r8             ; r6 = tick + 1
    STORE r20, r6          ; tick++

    ; Compute phase = tick % 200
    LDI r5, 0
    ADD r5, r6             ; r5 = tick
    LDI r9, 200
    MOD r5, r9             ; r5 = tick % 200 (0..199)

    ; Triangle wave from phase:
    ;   if phase < 100: bar_width = phase (ramp up)
    ;   if phase >= 100: bar_width = 200 - phase (ramp down)
    ; CMPI sets r13: 0xFFFFFFFF if <, 0 if ==, 1 if >
    ; BGE branches when r13 != 0xFFFFFFFF (i.e., >= )
    CMPI r5, 100
    BGE r13, ramp_down       ; if phase >= 100, go to ramp_down

    ; ramp up: bar_width = phase
    LDI r0, 0
    ADD r0, r5             ; r0 = phase (0..99)
    JMP store_width

ramp_down:
    ; ramp down: bar_width = 200 - phase
    LDI r7, 200
    LDI r0, 0
    ADD r0, r5             ; r0 = phase
    SUB r7, r0             ; r7 = 200 - phase
    LDI r0, 0
    ADD r0, r7             ; r0 = bar_width

store_width:
    LDI r20, BAR_W
    STORE r20, r0          ; save bar_width to RAM

    ; ── DRAW ──

    ; Clear screen to dark blue-black
    LDI r7, 0x0D0D1A
    FILL r7

    ; Draw bar: filled rectangle at (78, 100) with width=bar_width, height=30
    ; Color cycles: use tick to shift hue
    ; Simple: alternate between two colors based on tick/50
    LDI r20, TICK
    LOAD r6, r20           ; r6 = tick
    LDI r9, 50
    LDI r7, 0
    ADD r7, r6
    MOD r7, r9             ; r7 = tick % 50

    ; Color: 0x2ECC71 (green) base, shift with tick
    ; r10 = 0x2ECC71 + (tick % 50) * small_offset
    ; Simpler: just use tick low bits to cycle RGB
    LDI r10, 0x2ECC71       ; base green
    ADD r10, r6             ; shift color with tick (wraps around nicely)

    ; Bar position: x=78, y=100, w=bar_width, h=30
    LDI r8, 78             ; x
    LDI r7, 100            ; y
    LDI r6, 0
    ADD r6, r0             ; w = bar_width (from above)
    LDI r14, 30             ; h
    RECTF r8, r7, r6, r14, r10

    ; Draw "PULSE" title text
    LDI r20, SCRATCH       ; scratch buffer
    LDI r7, 80             ; 'P'
    STORE r20, r7
    LDI r8, 1
    ADD r20, r8
    LDI r7, 85             ; 'U'
    STORE r20, r7
    ADD r20, r8
    LDI r7, 76             ; 'L'
    STORE r20, r7
    ADD r20, r8
    LDI r7, 83             ; 'S'
    STORE r20, r7
    ADD r20, r8
    LDI r7, 69             ; 'E'
    STORE r20, r7
    ADD r20, r8
    LDI r7, 0              ; null terminator
    STORE r20, r7

    LDI r8, 5
    LDI r7, 5
    LDI r6, SCRATCH
    TEXT r8, r7, r6

    ; Draw frame counter as 3-digit number at (5, 20)
    LDI r20, SCRATCH
    LDI r20, TICK
    LOAD r4, r20          ; r4 = tick value

    ; Convert tick to 3 ASCII digits at 0x200
    LDI r8, 1
    LDI r20, SCRATCH

    ; Hundreds
    LDI r0, 100
    LDI r1, 0
    ADD r1, r4
    DIV r1, r0            ; r1 = hundreds
    LDI r7, 48
    ADD r7, r1
    STORE r20, r7
    ADD r20, r8

    ; Tens
    LDI r3, 0
    ADD r3, r1
    LDI r7, 100
    MUL r3, r7            ; r3 = hundreds * 100
    LDI r11, 0
    ADD r11, r4
    SUB r11, r3           ; r11 = remainder
    LDI r0, 10
    LDI r12, 0
    ADD r12, r11
    DIV r12, r0            ; r12 = tens
    LDI r7, 48
    ADD r7, r12
    STORE r20, r7
    ADD r20, r8

    ; Ones
    LDI r2, 0
    ADD r2, r11
    LDI r0, 10
    MOD r2, r0            ; r2 = ones
    LDI r7, 48
    ADD r7, r2
    STORE r20, r7
    ADD r20, r8
    LDI r7, 0
    STORE r20, r7          ; null terminate

    LDI r8, 5
    LDI r7, 20
    LDI r6, SCRATCH
    TEXT r8, r7, r6

    ; ── FRAME ──
    FRAME

    JMP main_loop
