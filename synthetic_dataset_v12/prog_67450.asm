; DESCRIPTION: Renders a blue box of size 78x89 starting at (425, 81).
; PLAN: r0=425(x), r1=81(y), r2=78(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 81
LDI r2, 78
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
