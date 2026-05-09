; DESCRIPTION: Renders a blue box of size 74x93 starting at (142, 77).
; PLAN: r0=142(x), r1=77(y), r2=74(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 77
LDI r2, 74
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
