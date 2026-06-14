; font_demo.asm -- Fixed vs proportional text comparison
; Top half: fixed-width TEXT (opcode 0x44)
; Bottom half: variable-width VWTXT (opcode 0xDB)
; Visual demo for Phase 286

; Write "AVATAR" to RAM at 0x2000
LDI r10, 0x2000
LDI r11, 65     ; A
STORE r10, r11
LDI r11, 86     ; V
LDI r12, 1
ADD r10, r12
STORE r10, r11
ADD r10, r12
LDI r11, 65     ; A
STORE r10, r11
ADD r10, r12
LDI r11, 84     ; T
STORE r10, r11
ADD r10, r12
LDI r11, 65     ; A
STORE r10, r11
ADD r10, r12
LDI r11, 82     ; R
STORE r10, r11
ADD r10, r12
LDI r11, 0      ; null
STORE r10, r11

; Write "MILLION" to RAM at 0x2100
LDI r10, 0x2100
LDI r11, 77     ; M
STORE r10, r11
LDI r12, 1
LDI r13, 73     ; I
ADD r10, r12
STORE r10, r13
ADD r10, r12
STORE r10, r13   ; I
ADD r10, r12
LDI r13, 76     ; L
STORE r10, r13
ADD r10, r12
LDI r13, 76     ; L
STORE r10, r13
ADD r10, r12
LDI r13, 73     ; I
STORE r10, r13
ADD r10, r12
LDI r13, 79     ; O
STORE r10, r13
ADD r10, r12
LDI r13, 78     ; N
STORE r10, r13
ADD r10, r12
LDI r13, 0
STORE r10, r13

; Write "illi" to RAM at 0x2200 (narrow test)
LDI r10, 0x2200
LDI r11, 105    ; i
STORE r10, r11
LDI r12, 1
ADD r10, r12
LDI r11, 108    ; l
STORE r10, r11
ADD r10, r12
STORE r10, r11
ADD r10, r12
LDI r11, 105    ; i
STORE r10, r11
ADD r10, r12
LDI r11, 0
STORE r10, r11

; ── Top half: Fixed-width TEXT ──
; Row label
LDI r1, 5
LDI r2, 2
LDI r3, 0x888888
LDI r0, 0x2300
LDI r11, 70     ; F
STORE r0, r11
LDI r12, 1
ADD r0, r12
LDI r11, 73     ; I
STORE r0, r11
ADD r0, r12
LDI r11, 88     ; X
STORE r0, r11
ADD r0, r12
LDI r11, 69     ; E
STORE r0, r11
ADD r0, r12
LDI r11, 68     ; D
STORE r0, r11
ADD r0, r12
LDI r11, 0
STORE r0, r11
; TEXT x_reg, y_reg, addr_reg
LDI r10, 0x2300
TEXT r1, r2, r10

; "AVATAR" in fixed-width at y=20
LDI r2, 20
LDI r3, 0xFFFFFF
LDI r10, 0x2000
TEXT r1, r2, r10

; "MILLION" in fixed-width at y=40
LDI r2, 40
LDI r10, 0x2100
TEXT r1, r2, r10

; "illi" in fixed-width at y=60
LDI r2, 60
LDI r10, 0x2200
TEXT r1, r2, r10

; ── Divider line ──
LDI r1, 0
LDI r2, 90
LDI r3, 255
LDI r4, 0x444444
LINE r1, r2, r3, r2, r4

; ── Bottom half: Variable-width VWTXT ──
; Row label (same text, VWTXT)
LDI r1, 5
LDI r2, 100
LDI r3, 0x888888
LDI r10, 0x2300
; VWTXT x_reg, y_reg, addr_reg, fg_reg, bg_reg
LDI r4, 0x000000
VWTXT r1, r2, r10, r3, r4

; "AVATAR" in proportional at y=120
LDI r2, 120
LDI r3, 0xFFFFFF
LDI r10, 0x2000
VWTXT r1, r2, r10, r3, r4

; "MILLION" in proportional at y=140
LDI r2, 140
LDI r10, 0x2100
VWTXT r1, r2, r10, r3, r4

; "illi" in proportional at y=160
LDI r2, 160
LDI r10, 0x2200
VWTXT r1, r2, r10, r3, r4

HALT
