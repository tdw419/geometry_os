; DESCRIPTION: Renders a yellow box of size 86x110 starting at (106, 18).
; PLAN: r0=106(x), r1=18(y), r2=86(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 18
LDI r2, 86
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
