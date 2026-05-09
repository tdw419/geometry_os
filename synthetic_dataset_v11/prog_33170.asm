; DESCRIPTION: Renders a blue box of size 119x114 starting at (91, 34).
; PLAN: r0=91(x), r1=34(y), r2=119(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 34
LDI r2, 119
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
