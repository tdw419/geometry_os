; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

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
;   r12  - scratch
;   r15  - scratch (tick, temp)
;   r2  - color
;   r13  - bar width
;   r11  - divisor/modulus (200, 100)
;   r0  - phase (tick % 200)
;   r5  - frame_count from RAM[0xFFE]
;

#define TICK      0x200
#define BAR_W     0x204
#define SCRATCH   0x300
#define FCOUNT    0xFFE

; ── INIT ──────────────────────────────────────
LDI r9, 1

; tick = 0
LDI r12, TICK
LDI r15, 0
STORE r12, r15

; bar_width = 0
LDI r12, BAR_W
LDI r15, 0
STORE r12, r15

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r9, 1

    ; ── UPDATE STATE ──

    ; Increment tick
    LDI r20, TICK
    LOAD r15, r20           ; r15 = tick
    ADD r15, r9             ; r15 = tick + 1
    STORE r20, r15          ; tick++

    ; Compute phase = tick % 200
    LDI r0, 0
    ADD r0, r15             ; r0 = tick
    LDI r11, 200
    MOD r0, r11             ; r0 = tick % 200 (0..199)

    ; Triangle wave from phase:
    ;   if phase < 100: bar_width = phase (ramp up)
    ;   if phase >= 100: bar_width = 200 - phase (ramp down)
    ; CMPI sets r4: 0xFFFFFFFF if <, 0 if ==, 1 if >
    ; BGE branches when r4 != 0xFFFFFFFF (i.e., >= )
    CMPI r0, 100
    BGE r4, ramp_down       ; if phase >= 100, go to ramp_down

    ; ramp up: bar_width = phase
    LDI r13, 0
    ADD r13, r0             ; r13 = phase (0..99)
    JMP store_width

ramp_down:
    ; ramp down: bar_width = 200 - phase
    LDI r12, 200
    LDI r13, 0
    ADD r13, r0             ; r13 = phase
    SUB r12, r13             ; r12 = 200 - phase
    LDI r13, 0
    ADD r13, r12             ; r13 = bar_width

store_width:
    LDI r20, BAR_W
    STORE r20, r13          ; save bar_width to RAM

    ; ── DRAW ──

    ; Clear screen to dark blue-black
    LDI r12, 0x0D0D1A
    FILL r12

    ; Draw bar: filled rectangle at (78, 100) with width=bar_width, height=30
    ; Color cycles: use tick to shift hue
    ; Simple: alternate between two colors based on tick/50
    LDI r20, TICK
    LOAD r15, r20           ; r15 = tick
    LDI r11, 50
    LDI r12, 0
    ADD r12, r15
    MOD r12, r11             ; r12 = tick % 50

    ; Color: 0x2ECC71 (green) base, shift with tick
    ; r2 = 0x2ECC71 + (tick % 50) * small_offset
    ; Simpler: just use tick low bits to cycle RGB
    LDI r2, 0x2ECC71       ; base green
    ADD r2, r15             ; shift color with tick (wraps around nicely)

    ; Bar position: x=78, y=100, w=bar_width, h=30
    LDI r9, 78             ; x
    LDI r12, 100            ; y
    LDI r15, 0
    ADD r15, r13             ; w = bar_width (from above)
    LDI r10, 30             ; h
    RECTF r9, r12, r15, r10, r2

    ; Draw "PULSE" title text
    LDI r20, SCRATCH       ; scratch buffer
    LDI r12, 80             ; 'P'
    STORE r20, r12
    LDI r9, 1
    ADD r20, r9
    LDI r12, 85             ; 'U'
    STORE r20, r12
    ADD r20, r9
    LDI r12, 76             ; 'L'
    STORE r20, r12
    ADD r20, r9
    LDI r12, 83             ; 'S'
    STORE r20, r12
    ADD r20, r9
    LDI r12, 69             ; 'E'
    STORE r20, r12
    ADD r20, r9
    LDI r12, 0              ; null terminator
    STORE r20, r12

    LDI r9, 5
    LDI r12, 5
    LDI r15, SCRATCH
    TEXT r9, r12, r15

    ; Draw frame counter as 3-digit number at (5, 20)
    LDI r20, SCRATCH
    LDI r20, TICK
    LOAD r6, r20          ; r6 = tick value

    ; Convert tick to 3 ASCII digits at 0x200
    LDI r9, 1
    LDI r20, SCRATCH

    ; Hundreds
    LDI r13, 100
    LDI r3, 0
    ADD r3, r6
    DIV r3, r13            ; r3 = hundreds
    LDI r12, 48
    ADD r12, r3
    STORE r20, r12
    ADD r20, r9

    ; Tens
    LDI r14, 0
    ADD r14, r3
    LDI r12, 100
    MUL r14, r12            ; r14 = hundreds * 100
    LDI r7, 0
    ADD r7, r6
    SUB r7, r14           ; r7 = remainder
    LDI r13, 10
    LDI r8, 0
    ADD r8, r7
    DIV r8, r13            ; r8 = tens
    LDI r12, 48
    ADD r12, r8
    STORE r20, r12
    ADD r20, r9

    ; Ones
    LDI r1, 0
    ADD r1, r7
    LDI r13, 10
    MOD r1, r13            ; r1 = ones
    LDI r12, 48
    ADD r12, r1
    STORE r20, r12
    ADD r20, r9
    LDI r12, 0
    STORE r20, r12          ; null terminate

    LDI r9, 5
    LDI r12, 20
    LDI r15, SCRATCH
    TEXT r9, r12, r15

    ; ── FRAME ──
    FRAME

    JMP main_loop
