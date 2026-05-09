; DESCRIPTION: Renders a blue box of size 70x35 starting at (68, 110).
; PLAN: r0=68(x), r1=110(y), r2=70(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 110
LDI r2, 70
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
