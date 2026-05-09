; DESCRIPTION: Renders a blue box of size 19x102 starting at (227, 1).
; PLAN: r0=227(x), r1=1(y), r2=19(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 1
LDI r2, 19
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
