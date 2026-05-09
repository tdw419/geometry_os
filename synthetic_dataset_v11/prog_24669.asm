; DESCRIPTION: Renders a blue box of size 100x54 starting at (22, 25).
; PLAN: r0=22(x), r1=25(y), r2=100(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 25
LDI r2, 100
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
