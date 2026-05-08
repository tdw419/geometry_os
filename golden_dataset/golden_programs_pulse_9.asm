; DESCRIPTION: Render a colored object at the screen.

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
;   r12  - constant 1
;   r6  - scratch
;   r1  - scratch (tick, temp)
;   r7  - color
;   r14  - bar width
;   r13  - divisor/modulus (200, 100)
;   r15  - phase (tick % 200)
;   r3  - frame_count from RAM[0xFFE]
;

#define TICK      0x200
#define BAR_W     0x204
#define SCRATCH   0x300
#define FCOUNT    0xFFE

; ── INIT ──────────────────────────────────────
LDI r12, 1

; tick = 0
LDI r6, TICK
LDI r1, 0
STORE r6, r1

; bar_width = 0
LDI r6, BAR_W
LDI r1, 0
STORE r6, r1

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r12, 1

    ; ── UPDATE STATE ──

    ; Increment tick
    LDI r20, TICK
    LOAD r1, r20           ; r1 = tick
    ADD r1, r12             ; r1 = tick + 1
    STORE r20, r1          ; tick++

    ; Compute phase = tick % 200
    LDI r15, 0
    ADD r15, r1             ; r15 = tick
    LDI r13, 200
    MOD r15, r13             ; r15 = tick % 200 (0..199)

    ; Triangle wave from phase:
    ;   if phase < 100: bar_width = phase (ramp up)
    ;   if phase >= 100: bar_width = 200 - phase (ramp down)
    ; CMPI sets r0: 0xFFFFFFFF if <, 0 if ==, 1 if >
    ; BGE branches when r0 != 0xFFFFFFFF (i.e., >= )
    CMPI r15, 100
    BGE r0, ramp_down       ; if phase >= 100, go to ramp_down

    ; ramp up: bar_width = phase
    LDI r14, 0
    ADD r14, r15             ; r14 = phase (0..99)
    JMP store_width

ramp_down:
    ; ramp down: bar_width = 200 - phase
    LDI r6, 200
    LDI r14, 0
    ADD r14, r15             ; r14 = phase
    SUB r6, r14             ; r6 = 200 - phase
    LDI r14, 0
    ADD r14, r6             ; r14 = bar_width

store_width:
    LDI r20, BAR_W
    STORE r20, r14          ; save bar_width to RAM

    ; ── DRAW ──

    ; Clear screen to dark blue-black
    LDI r6, 0x0D0D1A
    FILL r6

    ; Draw bar: filled rectangle at (78, 100) with width=bar_width, height=30
    ; Color cycles: use tick to shift hue
    ; Simple: alternate between two colors based on tick/50
    LDI r20, TICK
    LOAD r1, r20           ; r1 = tick
    LDI r13, 50
    LDI r6, 0
    ADD r6, r1
    MOD r6, r13             ; r6 = tick % 50

    ; Color: 0x2ECC71 (green) base, shift with tick
    ; r7 = 0x2ECC71 + (tick % 50) * small_offset
    ; Simpler: just use tick low bits to cycle RGB
    LDI r7, 0x2ECC71       ; base green
    ADD r7, r1             ; shift color with tick (wraps around nicely)

    ; Bar position: x=78, y=100, w=bar_width, h=30
    LDI r12, 78             ; x
    LDI r6, 100            ; y
    LDI r1, 0
    ADD r1, r14             ; w = bar_width (from above)
    LDI r5, 30             ; h
    RECTF r12, r6, r1, r5, r7

    ; Draw "PULSE" title text
    LDI r20, SCRATCH       ; scratch buffer
    LDI r6, 80             ; 'P'
    STORE r20, r6
    LDI r12, 1
    ADD r20, r12
    LDI r6, 85             ; 'U'
    STORE r20, r6
    ADD r20, r12
    LDI r6, 76             ; 'L'
    STORE r20, r6
    ADD r20, r12
    LDI r6, 83             ; 'S'
    STORE r20, r6
    ADD r20, r12
    LDI r6, 69             ; 'E'
    STORE r20, r6
    ADD r20, r12
    LDI r6, 0              ; null terminator
    STORE r20, r6

    LDI r12, 5
    LDI r6, 5
    LDI r1, SCRATCH
    TEXT r12, r6, r1

    ; Draw frame counter as 3-digit number at (5, 20)
    LDI r20, SCRATCH
    LDI r20, TICK
    LOAD r10, r20          ; r10 = tick value

    ; Convert tick to 3 ASCII digits at 0x200
    LDI r12, 1
    LDI r20, SCRATCH

    ; Hundreds
    LDI r14, 100
    LDI r8, 0
    ADD r8, r10
    DIV r8, r14            ; r8 = hundreds
    LDI r6, 48
    ADD r6, r8
    STORE r20, r6
    ADD r20, r12

    ; Tens
    LDI r4, 0
    ADD r4, r8
    LDI r6, 100
    MUL r4, r6            ; r4 = hundreds * 100
    LDI r2, 0
    ADD r2, r10
    SUB r2, r4           ; r2 = remainder
    LDI r14, 10
    LDI r11, 0
    ADD r11, r2
    DIV r11, r14            ; r11 = tens
    LDI r6, 48
    ADD r6, r11
    STORE r20, r6
    ADD r20, r12

    ; Ones
    LDI r9, 0
    ADD r9, r2
    LDI r14, 10
    MOD r9, r14            ; r9 = ones
    LDI r6, 48
    ADD r6, r9
    STORE r20, r6
    ADD r20, r12
    LDI r6, 0
    STORE r20, r6          ; null terminate

    LDI r12, 5
    LDI r6, 20
    LDI r1, SCRATCH
    TEXT r12, r6, r1

    ; ── FRAME ──
    FRAME

    JMP main_loop
