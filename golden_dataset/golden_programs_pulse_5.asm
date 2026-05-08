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
;   r1  - constant 1
;   r15  - scratch
;   r4  - scratch (tick, temp)
;   r6  - color
;   r3  - bar width
;   r9  - divisor/modulus (200, 100)
;   r12  - phase (tick % 200)
;   r10  - frame_count from RAM[0xFFE]
;

#define TICK      0x200
#define BAR_W     0x204
#define SCRATCH   0x300
#define FCOUNT    0xFFE

; ── INIT ──────────────────────────────────────
LDI r1, 1

; tick = 0
LDI r15, TICK
LDI r4, 0
STORE r15, r4

; bar_width = 0
LDI r15, BAR_W
LDI r4, 0
STORE r15, r4

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r1, 1

    ; ── UPDATE STATE ──

    ; Increment tick
    LDI r20, TICK
    LOAD r4, r20           ; r4 = tick
    ADD r4, r1             ; r4 = tick + 1
    STORE r20, r4          ; tick++

    ; Compute phase = tick % 200
    LDI r12, 0
    ADD r12, r4             ; r12 = tick
    LDI r9, 200
    MOD r12, r9             ; r12 = tick % 200 (0..199)

    ; Triangle wave from phase:
    ;   if phase < 100: bar_width = phase (ramp up)
    ;   if phase >= 100: bar_width = 200 - phase (ramp down)
    ; CMPI sets r13: 0xFFFFFFFF if <, 0 if ==, 1 if >
    ; BGE branches when r13 != 0xFFFFFFFF (i.e., >= )
    CMPI r12, 100
    BGE r13, ramp_down       ; if phase >= 100, go to ramp_down

    ; ramp up: bar_width = phase
    LDI r3, 0
    ADD r3, r12             ; r3 = phase (0..99)
    JMP store_width

ramp_down:
    ; ramp down: bar_width = 200 - phase
    LDI r15, 200
    LDI r3, 0
    ADD r3, r12             ; r3 = phase
    SUB r15, r3             ; r15 = 200 - phase
    LDI r3, 0
    ADD r3, r15             ; r3 = bar_width

store_width:
    LDI r20, BAR_W
    STORE r20, r3          ; save bar_width to RAM

    ; ── DRAW ──

    ; Clear screen to dark blue-black
    LDI r15, 0x0D0D1A
    FILL r15

    ; Draw bar: filled rectangle at (78, 100) with width=bar_width, height=30
    ; Color cycles: use tick to shift hue
    ; Simple: alternate between two colors based on tick/50
    LDI r20, TICK
    LOAD r4, r20           ; r4 = tick
    LDI r9, 50
    LDI r15, 0
    ADD r15, r4
    MOD r15, r9             ; r15 = tick % 50

    ; Color: 0x2ECC71 (green) base, shift with tick
    ; r6 = 0x2ECC71 + (tick % 50) * small_offset
    ; Simpler: just use tick low bits to cycle RGB
    LDI r6, 0x2ECC71       ; base green
    ADD r6, r4             ; shift color with tick (wraps around nicely)

    ; Bar position: x=78, y=100, w=bar_width, h=30
    LDI r1, 78             ; x
    LDI r15, 100            ; y
    LDI r4, 0
    ADD r4, r3             ; w = bar_width (from above)
    LDI r11, 30             ; h
    RECTF r1, r15, r4, r11, r6

    ; Draw "PULSE" title text
    LDI r20, SCRATCH       ; scratch buffer
    LDI r15, 80             ; 'P'
    STORE r20, r15
    LDI r1, 1
    ADD r20, r1
    LDI r15, 85             ; 'U'
    STORE r20, r15
    ADD r20, r1
    LDI r15, 76             ; 'L'
    STORE r20, r15
    ADD r20, r1
    LDI r15, 83             ; 'S'
    STORE r20, r15
    ADD r20, r1
    LDI r15, 69             ; 'E'
    STORE r20, r15
    ADD r20, r1
    LDI r15, 0              ; null terminator
    STORE r20, r15

    LDI r1, 5
    LDI r15, 5
    LDI r4, SCRATCH
    TEXT r1, r15, r4

    ; Draw frame counter as 3-digit number at (5, 20)
    LDI r20, SCRATCH
    LDI r20, TICK
    LOAD r7, r20          ; r7 = tick value

    ; Convert tick to 3 ASCII digits at 0x200
    LDI r1, 1
    LDI r20, SCRATCH

    ; Hundreds
    LDI r3, 100
    LDI r14, 0
    ADD r14, r7
    DIV r14, r3            ; r14 = hundreds
    LDI r15, 48
    ADD r15, r14
    STORE r20, r15
    ADD r20, r1

    ; Tens
    LDI r0, 0
    ADD r0, r14
    LDI r15, 100
    MUL r0, r15            ; r0 = hundreds * 100
    LDI r8, 0
    ADD r8, r7
    SUB r8, r0           ; r8 = remainder
    LDI r3, 10
    LDI r5, 0
    ADD r5, r8
    DIV r5, r3            ; r5 = tens
    LDI r15, 48
    ADD r15, r5
    STORE r20, r15
    ADD r20, r1

    ; Ones
    LDI r2, 0
    ADD r2, r8
    LDI r3, 10
    MOD r2, r3            ; r2 = ones
    LDI r15, 48
    ADD r15, r2
    STORE r20, r15
    ADD r20, r1
    LDI r15, 0
    STORE r20, r15          ; null terminate

    LDI r1, 5
    LDI r15, 20
    LDI r4, SCRATCH
    TEXT r1, r15, r4

    ; ── FRAME ──
    FRAME

    JMP main_loop
