; DESCRIPTION: Renders a blue box of size 118x114 starting at (239, 69).
; PLAN: r0=239(x), r1=69(y), r2=118(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 69
LDI r2, 118
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
