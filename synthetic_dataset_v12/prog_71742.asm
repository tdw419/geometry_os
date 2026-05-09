; DESCRIPTION: Renders a blue box of size 88x108 starting at (47, 118).
; PLAN: r0=47(x), r1=118(y), r2=88(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 118
LDI r2, 88
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
