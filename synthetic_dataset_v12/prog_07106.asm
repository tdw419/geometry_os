; DESCRIPTION: Renders a blue box of size 104x114 starting at (138, 3).
; PLAN: r0=138(x), r1=3(y), r2=104(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 3
LDI r2, 104
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
