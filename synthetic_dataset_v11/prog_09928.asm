; DESCRIPTION: Renders a blue box of size 89x89 starting at (52, 62).
; PLAN: r0=52(x), r1=62(y), r2=89(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 62
LDI r2, 89
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
