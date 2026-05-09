; DESCRIPTION: Renders a yellow box of size 10x110 starting at (144, 43).
; PLAN: r0=144(x), r1=43(y), r2=10(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 43
LDI r2, 10
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
