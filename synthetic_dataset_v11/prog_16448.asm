; DESCRIPTION: Renders a black box of size 119x89 starting at (60, 147).
; PLAN: r0=60(x), r1=147(y), r2=119(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 147
LDI r2, 119
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
