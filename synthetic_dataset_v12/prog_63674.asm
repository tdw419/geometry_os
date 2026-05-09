; DESCRIPTION: Renders a blue box of size 100x114 starting at (98, 93).
; PLAN: r0=98(x), r1=93(y), r2=100(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 93
LDI r2, 100
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
