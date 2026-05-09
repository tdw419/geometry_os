; DESCRIPTION: Renders a blue box of size 81x33 starting at (53, 157).
; PLAN: r0=53(x), r1=157(y), r2=81(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 157
LDI r2, 81
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
