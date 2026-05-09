; DESCRIPTION: Renders a blue box of size 115x89 starting at (131, 4).
; PLAN: r0=131(x), r1=4(y), r2=115(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 4
LDI r2, 115
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
