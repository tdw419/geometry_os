; DESCRIPTION: Renders a blue box of size 104x114 starting at (29, 112).
; PLAN: r0=29(x), r1=112(y), r2=104(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 112
LDI r2, 104
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
