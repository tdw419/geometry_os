; DESCRIPTION: Renders a black box of size 20x109 starting at (251, 88).
; PLAN: r0=251(x), r1=88(y), r2=20(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 88
LDI r2, 20
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
