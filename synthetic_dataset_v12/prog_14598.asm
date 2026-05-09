; DESCRIPTION: Renders a yellow box of size 107x110 starting at (99, 119).
; PLAN: r0=99(x), r1=119(y), r2=107(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 119
LDI r2, 107
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
