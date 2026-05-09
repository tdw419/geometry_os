; DESCRIPTION: Renders a green box of size 110x96 starting at (219, 160).
; PLAN: r0=219(x), r1=160(y), r2=110(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 160
LDI r2, 110
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
