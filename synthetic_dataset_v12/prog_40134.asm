; DESCRIPTION: Renders a purple box of size 66x101 starting at (33, 133).
; PLAN: r0=33(x), r1=133(y), r2=66(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 133
LDI r2, 66
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
