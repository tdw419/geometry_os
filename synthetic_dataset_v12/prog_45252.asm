; DESCRIPTION: Renders a purple box of size 118x79 starting at (78, 34).
; PLAN: r0=78(x), r1=34(y), r2=118(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 34
LDI r2, 118
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
