; DESCRIPTION: Renders a purple box of size 88x114 starting at (307, 78).
; PLAN: r0=307(x), r1=78(y), r2=88(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 78
LDI r2, 88
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
