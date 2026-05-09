; DESCRIPTION: Renders a blue box of size 68x117 starting at (78, 136).
; PLAN: r0=78(x), r1=136(y), r2=68(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 136
LDI r2, 68
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
