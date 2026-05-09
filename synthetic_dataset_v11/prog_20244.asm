; DESCRIPTION: Renders a blue box of size 101x89 starting at (31, 61).
; PLAN: r0=31(x), r1=61(y), r2=101(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 61
LDI r2, 101
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
