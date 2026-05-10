; DESCRIPTION: Renders a blue box of size 26x100 starting at (81, 118).
; PLAN: r0=81(x), r1=118(y), r2=26(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 118
LDI r2, 26
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
