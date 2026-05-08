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
;   r1  - constant 1
;   r11  - scratch
;   r14  - scratch (tick, temp)
;   r6  - color
;   r8  - bar width
;   r3  - divisor/modulus (200, 100)
;   r9  - phase (tick % 200)
;   r13  - frame_count from RAM[0xFFE]
;

#define TICK      0x200
#define BAR_W     0x204
#define SCRATCH   0x300
#define FCOUNT    0xFFE

; ── INIT ──────────────────────────────────────
LDI r1, 1

; tick = 0
LDI r11, TICK
LDI r14, 0
STORE r11, r14

; bar_width = 0
LDI r11, BAR_W
LDI r14, 0
STORE r11, r14

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r1, 1

    ; ── UPDATE STATE ──

    ; Increment tick
    LDI r20, TICK
    LOAD r14, r20           ; r14 = tick
    ADD r14, r1             ; r14 = tick + 1
    STORE r20, r14          ; tick++

    ; Compute phase = tick % 200
    LDI r9, 0
    ADD r9, r14             ; r9 = tick
    LDI r3, 200
    MOD r9, r3             ; r9 = tick % 200 (0..199)

    ; Triangle wave from phase:
    ;   if phase < 100: bar_width = phase (ramp up)
    ;   if phase >= 100: bar_width = 200 - phase (ramp down)
    ; CMPI sets r15: 0xFFFFFFFF if <, 0 if ==, 1 if >
    ; BGE branches when r15 != 0xFFFFFFFF (i.e., >= )
    CMPI r9, 100
    BGE r15, ramp_down       ; if phase >= 100, go to ramp_down

    ; ramp up: bar_width = phase
    LDI r8, 0
    ADD r8, r9             ; r8 = phase (0..99)
    JMP store_width

ramp_down:
    ; ramp down: bar_width = 200 - phase
    LDI r11, 200
    LDI r8, 0
    ADD r8, r9             ; r8 = phase
    SUB r11, r8             ; r11 = 200 - phase
    LDI r8, 0
    ADD r8, r11             ; r8 = bar_width

store_width:
    LDI r20, BAR_W
    STORE r20, r8          ; save bar_width to RAM

    ; ── DRAW ──

    ; Clear screen to dark blue-black
    LDI r11, 0x0D0D1A
    FILL r11

    ; Draw bar: filled rectangle at (78, 100) with width=bar_width, height=30
    ; Color cycles: use tick to shift hue
    ; Simple: alternate between two colors based on tick/50
    LDI r20, TICK
    LOAD r14, r20           ; r14 = tick
    LDI r3, 50
    LDI r11, 0
    ADD r11, r14
    MOD r11, r3             ; r11 = tick % 50

    ; Color: 0x2ECC71 (green) base, shift with tick
    ; r6 = 0x2ECC71 + (tick % 50) * small_offset
    ; Simpler: just use tick low bits to cycle RGB
    LDI r6, 0x2ECC71       ; base green
    ADD r6, r14             ; shift color with tick (wraps around nicely)

    ; Bar position: x=78, y=100, w=bar_width, h=30
    LDI r1, 78             ; x
    LDI r11, 100            ; y
    LDI r14, 0
    ADD r14, r8             ; w = bar_width (from above)
    LDI r0, 30             ; h
    RECTF r1, r11, r14, r0, r6

    ; Draw "PULSE" title text
    LDI r20, SCRATCH       ; scratch buffer
    LDI r11, 80             ; 'P'
    STORE r20, r11
    LDI r1, 1
    ADD r20, r1
    LDI r11, 85             ; 'U'
    STORE r20, r11
    ADD r20, r1
    LDI r11, 76             ; 'L'
    STORE r20, r11
    ADD r20, r1
    LDI r11, 83             ; 'S'
    STORE r20, r11
    ADD r20, r1
    LDI r11, 69             ; 'E'
    STORE r20, r11
    ADD r20, r1
    LDI r11, 0              ; null terminator
    STORE r20, r11

    LDI r1, 5
    LDI r11, 5
    LDI r14, SCRATCH
    TEXT r1, r11, r14

    ; Draw frame counter as 3-digit number at (5, 20)
    LDI r20, SCRATCH
    LDI r20, TICK
    LOAD r4, r20          ; r4 = tick value

    ; Convert tick to 3 ASCII digits at 0x200
    LDI r1, 1
    LDI r20, SCRATCH

    ; Hundreds
    LDI r8, 100
    LDI r5, 0
    ADD r5, r4
    DIV r5, r8            ; r5 = hundreds
    LDI r11, 48
    ADD r11, r5
    STORE r20, r11
    ADD r20, r1

    ; Tens
    LDI r12, 0
    ADD r12, r5
    LDI r11, 100
    MUL r12, r11            ; r12 = hundreds * 100
    LDI r7, 0
    ADD r7, r4
    SUB r7, r12           ; r7 = remainder
    LDI r8, 10
    LDI r10, 0
    ADD r10, r7
    DIV r10, r8            ; r10 = tens
    LDI r11, 48
    ADD r11, r10
    STORE r20, r11
    ADD r20, r1

    ; Ones
    LDI r2, 0
    ADD r2, r7
    LDI r8, 10
    MOD r2, r8            ; r2 = ones
    LDI r11, 48
    ADD r11, r2
    STORE r20, r11
    ADD r20, r1
    LDI r11, 0
    STORE r20, r11          ; null terminate

    LDI r1, 5
    LDI r11, 20
    LDI r14, SCRATCH
    TEXT r1, r11, r14

    ; ── FRAME ──
    FRAME

    JMP main_loop
