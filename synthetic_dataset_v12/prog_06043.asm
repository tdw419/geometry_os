; DESCRIPTION: Renders a blue box of size 110x20 starting at (170, 123).
; PLAN: r0=170(x), r1=123(y), r2=110(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 123
LDI r2, 110
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
