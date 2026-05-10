; DESCRIPTION: Renders a blue box of size 20x52 starting at (94, 84).
; PLAN: r0=94(x), r1=84(y), r2=20(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 84
LDI r2, 20
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
