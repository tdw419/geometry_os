; DESCRIPTION: Renders a black box of size 15x88 starting at (448, 47).
; PLAN: r0=448(x), r1=47(y), r2=15(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 47
LDI r2, 15
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
