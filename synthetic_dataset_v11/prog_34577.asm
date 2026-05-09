; DESCRIPTION: Renders a blue box of size 85x114 starting at (93, 48).
; PLAN: r0=93(x), r1=48(y), r2=85(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 48
LDI r2, 85
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
