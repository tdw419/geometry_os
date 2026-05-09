; DESCRIPTION: Renders a black box of size 35x89 starting at (100, 22).
; PLAN: r0=100(x), r1=22(y), r2=35(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 22
LDI r2, 35
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
