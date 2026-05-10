; DESCRIPTION: Renders a blue box of size 106x22 starting at (209, 110).
; PLAN: r0=209(x), r1=110(y), r2=106(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 110
LDI r2, 106
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
