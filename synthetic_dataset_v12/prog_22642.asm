; DESCRIPTION: Renders a black box of size 105x30 starting at (22, 147).
; PLAN: r0=22(x), r1=147(y), r2=105(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 147
LDI r2, 105
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
