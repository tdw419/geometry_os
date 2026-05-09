; DESCRIPTION: Renders a blue box of size 114x79 starting at (116, 69).
; PLAN: r0=116(x), r1=69(y), r2=114(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 69
LDI r2, 114
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
