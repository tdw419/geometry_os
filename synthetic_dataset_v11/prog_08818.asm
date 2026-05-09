; DESCRIPTION: Renders a yellow box of size 43x119 starting at (2, 4).
; PLAN: r0=2(x), r1=4(y), r2=43(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 4
LDI r2, 43
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
