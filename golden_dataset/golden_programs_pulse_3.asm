; DESCRIPTION: Display a object using color colored at the screen.

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
;   r15  - scratch
;   r12  - scratch (tick, temp)
;   r9  - color
;   r7  - bar width
;   r14  - divisor/modulus (200, 100)
;   r2  - phase (tick % 200)
;   r6  - frame_count from RAM[0xFFE]
;

#define TICK      0x200
#define BAR_W     0x204
#define SCRATCH   0x300
#define FCOUNT    0xFFE

; ── INIT ──────────────────────────────────────
LDI r11, 1

; tick = 0
LDI r15, TICK
LDI r12, 0
STORE r15, r12

; bar_width = 0
LDI r15, BAR_W
LDI r12, 0
STORE r15, r12

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r11, 1

    ; ── UPDATE STATE ──

    ; Increment tick
    LDI r20, TICK
    LOAD r12, r20           ; r12 = tick
    ADD r12, r11             ; r12 = tick + 1
    STORE r20, r12          ; tick++

    ; Compute phase = tick % 200
    LDI r2, 0
    ADD r2, r12             ; r2 = tick
    LDI r14, 200
    MOD r2, r14             ; r2 = tick % 200 (0..199)

    ; Triangle wave from phase:
    ;   if phase < 100: bar_width = phase (ramp up)
    ;   if phase >= 100: bar_width = 200 - phase (ramp down)
    ; CMPI sets r3: 0xFFFFFFFF if <, 0 if ==, 1 if >
    ; BGE branches when r3 != 0xFFFFFFFF (i.e., >= )
    CMPI r2, 100
    BGE r3, ramp_down       ; if phase >= 100, go to ramp_down

    ; ramp up: bar_width = phase
    LDI r7, 0
    ADD r7, r2             ; r7 = phase (0..99)
    JMP store_width

ramp_down:
    ; ramp down: bar_width = 200 - phase
    LDI r15, 200
    LDI r7, 0
    ADD r7, r2             ; r7 = phase
    SUB r15, r7             ; r15 = 200 - phase
    LDI r7, 0
    ADD r7, r15             ; r7 = bar_width

store_width:
    LDI r20, BAR_W
    STORE r20, r7          ; save bar_width to RAM

    ; ── DRAW ──

    ; Clear screen to dark blue-black
    LDI r15, 0x0D0D1A
    FILL r15

    ; Draw bar: filled rectangle at (78, 100) with width=bar_width, height=30
    ; Color cycles: use tick to shift hue
    ; Simple: alternate between two colors based on tick/50
    LDI r20, TICK
    LOAD r12, r20           ; r12 = tick
    LDI r14, 50
    LDI r15, 0
    ADD r15, r12
    MOD r15, r14             ; r15 = tick % 50

    ; Color: 0x2ECC71 (green) base, shift with tick
    ; r9 = 0x2ECC71 + (tick % 50) * small_offset
    ; Simpler: just use tick low bits to cycle RGB
    LDI r9, 0x2ECC71       ; base green
    ADD r9, r12             ; shift color with tick (wraps around nicely)

    ; Bar position: x=78, y=100, w=bar_width, h=30
    LDI r11, 78             ; x
    LDI r15, 100            ; y
    LDI r12, 0
    ADD r12, r7             ; w = bar_width (from above)
    LDI r0, 30             ; h
    RECTF r11, r15, r12, r0, r9

    ; Draw "PULSE" title text
    LDI r20, SCRATCH       ; scratch buffer
    LDI r15, 80             ; 'P'
    STORE r20, r15
    LDI r11, 1
    ADD r20, r11
    LDI r15, 85             ; 'U'
    STORE r20, r15
    ADD r20, r11
    LDI r15, 76             ; 'L'
    STORE r20, r15
    ADD r20, r11
    LDI r15, 83             ; 'S'
    STORE r20, r15
    ADD r20, r11
    LDI r15, 69             ; 'E'
    STORE r20, r15
    ADD r20, r11
    LDI r15, 0              ; null terminator
    STORE r20, r15

    LDI r11, 5
    LDI r15, 5
    LDI r12, SCRATCH
    TEXT r11, r15, r12

    ; Draw frame counter as 3-digit number at (5, 20)
    LDI r20, SCRATCH
    LDI r20, TICK
    LOAD r4, r20          ; r4 = tick value

    ; Convert tick to 3 ASCII digits at 0x200
    LDI r11, 1
    LDI r20, SCRATCH

    ; Hundreds
    LDI r7, 100
    LDI r8, 0
    ADD r8, r4
    DIV r8, r7            ; r8 = hundreds
    LDI r15, 48
    ADD r15, r8
    STORE r20, r15
    ADD r20, r11

    ; Tens
    LDI r10, 0
    ADD r10, r8
    LDI r15, 100
    MUL r10, r15            ; r10 = hundreds * 100
    LDI r1, 0
    ADD r1, r4
    SUB r1, r10           ; r1 = remainder
    LDI r7, 10
    LDI r5, 0
    ADD r5, r1
    DIV r5, r7            ; r5 = tens
    LDI r15, 48
    ADD r15, r5
    STORE r20, r15
    ADD r20, r11

    ; Ones
    LDI r13, 0
    ADD r13, r1
    LDI r7, 10
    MOD r13, r7            ; r13 = ones
    LDI r15, 48
    ADD r15, r13
    STORE r20, r15
    ADD r20, r11
    LDI r15, 0
    STORE r20, r15          ; null terminate

    LDI r11, 5
    LDI r15, 20
    LDI r12, SCRATCH
    TEXT r11, r15, r12

    ; ── FRAME ──
    FRAME

    JMP main_loop
