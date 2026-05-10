; DESCRIPTION: Renders a green box of size 110x13 starting at (390, 124).
; PLAN: r0=390(x), r1=124(y), r2=110(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 124
LDI r2, 110
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
