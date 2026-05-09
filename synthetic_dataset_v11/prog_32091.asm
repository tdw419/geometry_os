; DESCRIPTION: Renders a black box of size 109x110 starting at (89, 90).
; PLAN: r0=89(x), r1=90(y), r2=109(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 90
LDI r2, 109
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
