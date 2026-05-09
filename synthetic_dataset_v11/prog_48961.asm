; DESCRIPTION: Renders a blue box of size 70x85 starting at (84, 52).
; PLAN: r0=84(x), r1=52(y), r2=70(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 52
LDI r2, 70
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
