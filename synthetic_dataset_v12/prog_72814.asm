; DESCRIPTION: Renders a purple box of size 53x101 starting at (1, 62).
; PLAN: r0=1(x), r1=62(y), r2=53(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 62
LDI r2, 53
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
