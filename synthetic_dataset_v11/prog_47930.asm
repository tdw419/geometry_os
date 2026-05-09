; DESCRIPTION: Renders a blue box of size 53x26 starting at (88, 39).
; PLAN: r0=88(x), r1=39(y), r2=53(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 39
LDI r2, 53
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
