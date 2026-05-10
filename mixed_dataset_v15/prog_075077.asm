; DESCRIPTION: Creates a purple filled rectangle of size 78x71 starting at (188, 78).
; PLAN: r0=188(x), r1=78(y), r2=78(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 78
LDI r2, 78
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
