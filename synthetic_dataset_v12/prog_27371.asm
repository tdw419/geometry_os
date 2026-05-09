; DESCRIPTION: Renders a blue box of size 11x70 starting at (89, 98).
; PLAN: r0=89(x), r1=98(y), r2=11(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 98
LDI r2, 11
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
