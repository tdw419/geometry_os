; DESCRIPTION: Renders a blue box of size 71x118 starting at (109, 67).
; PLAN: r0=109(x), r1=67(y), r2=71(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 67
LDI r2, 71
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
