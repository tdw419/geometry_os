; DESCRIPTION: Renders a black box of size 20x36 starting at (118, 66).
; PLAN: r0=118(x), r1=66(y), r2=20(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 66
LDI r2, 20
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
