; DESCRIPTION: Renders a blue box of size 16x33 starting at (390, 9).
; PLAN: r0=390(x), r1=9(y), r2=16(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 9
LDI r2, 16
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
