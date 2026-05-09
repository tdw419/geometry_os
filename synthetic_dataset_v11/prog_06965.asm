; DESCRIPTION: Renders a black box of size 119x13 starting at (43, 147).
; PLAN: r0=43(x), r1=147(y), r2=119(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 147
LDI r2, 119
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
