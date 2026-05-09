; DESCRIPTION: Renders a yellow box of size 35x79 starting at (402, 110).
; PLAN: r0=402(x), r1=110(y), r2=35(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 110
LDI r2, 35
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
