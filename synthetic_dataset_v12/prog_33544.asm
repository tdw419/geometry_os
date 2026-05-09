; DESCRIPTION: Renders a purple box of size 78x89 starting at (54, 49).
; PLAN: r0=54(x), r1=49(y), r2=78(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 49
LDI r2, 78
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
