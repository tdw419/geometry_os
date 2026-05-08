; DESCRIPTION: Geometry OS program to draw a colored object.

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
;   r14  - scratch
;   r9  - scratch (tick, temp)
;   r11  - color
;   r2  - bar width
;   r7  - divisor/modulus (200, 100)
;   r10  - phase (tick % 200)
;   r1  - frame_count from RAM[0xFFE]
;

#define TICK      0x200
#define BAR_W     0x204
#define SCRATCH   0x300
#define FCOUNT    0xFFE

; ── INIT ──────────────────────────────────────
LDI r8, 1

; tick = 0
LDI r14, TICK
LDI r9, 0
STORE r14, r9

; bar_width = 0
LDI r14, BAR_W
LDI r9, 0
STORE r14, r9

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r8, 1

    ; ── UPDATE STATE ──

    ; Increment tick
    LDI r20, TICK
    LOAD r9, r20           ; r9 = tick
    ADD r9, r8             ; r9 = tick + 1
    STORE r20, r9          ; tick++

    ; Compute phase = tick % 200
    LDI r10, 0
    ADD r10, r9             ; r10 = tick
    LDI r7, 200
    MOD r10, r7             ; r10 = tick % 200 (0..199)

    ; Triangle wave from phase:
    ;   if phase < 100: bar_width = phase (ramp up)
    ;   if phase >= 100: bar_width = 200 - phase (ramp down)
    ; CMPI sets r15: 0xFFFFFFFF if <, 0 if ==, 1 if >
    ; BGE branches when r15 != 0xFFFFFFFF (i.e., >= )
    CMPI r10, 100
    BGE r15, ramp_down       ; if phase >= 100, go to ramp_down

    ; ramp up: bar_width = phase
    LDI r2, 0
    ADD r2, r10             ; r2 = phase (0..99)
    JMP store_width

ramp_down:
    ; ramp down: bar_width = 200 - phase
    LDI r14, 200
    LDI r2, 0
    ADD r2, r10             ; r2 = phase
    SUB r14, r2             ; r14 = 200 - phase
    LDI r2, 0
    ADD r2, r14             ; r2 = bar_width

store_width:
    LDI r20, BAR_W
    STORE r20, r2          ; save bar_width to RAM

    ; ── DRAW ──

    ; Clear screen to dark blue-black
    LDI r14, 0x0D0D1A
    FILL r14

    ; Draw bar: filled rectangle at (78, 100) with width=bar_width, height=30
    ; Color cycles: use tick to shift hue
    ; Simple: alternate between two colors based on tick/50
    LDI r20, TICK
    LOAD r9, r20           ; r9 = tick
    LDI r7, 50
    LDI r14, 0
    ADD r14, r9
    MOD r14, r7             ; r14 = tick % 50

    ; Color: 0x2ECC71 (green) base, shift with tick
    ; r11 = 0x2ECC71 + (tick % 50) * small_offset
    ; Simpler: just use tick low bits to cycle RGB
    LDI r11, 0x2ECC71       ; base green
    ADD r11, r9             ; shift color with tick (wraps around nicely)

    ; Bar position: x=78, y=100, w=bar_width, h=30
    LDI r8, 78             ; x
    LDI r14, 100            ; y
    LDI r9, 0
    ADD r9, r2             ; w = bar_width (from above)
    LDI r0, 30             ; h
    RECTF r8, r14, r9, r0, r11

    ; Draw "PULSE" title text
    LDI r20, SCRATCH       ; scratch buffer
    LDI r14, 80             ; 'P'
    STORE r20, r14
    LDI r8, 1
    ADD r20, r8
    LDI r14, 85             ; 'U'
    STORE r20, r14
    ADD r20, r8
    LDI r14, 76             ; 'L'
    STORE r20, r14
    ADD r20, r8
    LDI r14, 83             ; 'S'
    STORE r20, r14
    ADD r20, r8
    LDI r14, 69             ; 'E'
    STORE r20, r14
    ADD r20, r8
    LDI r14, 0              ; null terminator
    STORE r20, r14

    LDI r8, 5
    LDI r14, 5
    LDI r9, SCRATCH
    TEXT r8, r14, r9

    ; Draw frame counter as 3-digit number at (5, 20)
    LDI r20, SCRATCH
    LDI r20, TICK
    LOAD r13, r20          ; r13 = tick value

    ; Convert tick to 3 ASCII digits at 0x200
    LDI r8, 1
    LDI r20, SCRATCH

    ; Hundreds
    LDI r2, 100
    LDI r3, 0
    ADD r3, r13
    DIV r3, r2            ; r3 = hundreds
    LDI r14, 48
    ADD r14, r3
    STORE r20, r14
    ADD r20, r8

    ; Tens
    LDI r4, 0
    ADD r4, r3
    LDI r14, 100
    MUL r4, r14            ; r4 = hundreds * 100
    LDI r5, 0
    ADD r5, r13
    SUB r5, r4           ; r5 = remainder
    LDI r2, 10
    LDI r6, 0
    ADD r6, r5
    DIV r6, r2            ; r6 = tens
    LDI r14, 48
    ADD r14, r6
    STORE r20, r14
    ADD r20, r8

    ; Ones
    LDI r12, 0
    ADD r12, r5
    LDI r2, 10
    MOD r12, r2            ; r12 = ones
    LDI r14, 48
    ADD r14, r12
    STORE r20, r14
    ADD r20, r8
    LDI r14, 0
    STORE r20, r14          ; null terminate

    LDI r8, 5
    LDI r14, 20
    LDI r9, SCRATCH
    TEXT r8, r14, r9

    ; ── FRAME ──
    FRAME

    JMP main_loop
