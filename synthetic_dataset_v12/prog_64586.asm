; DESCRIPTION: Renders a blue box of size 26x26 starting at (49, 81).
; PLAN: r0=49(x), r1=81(y), r2=26(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 81
LDI r2, 26
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
