; DESCRIPTION: Renders a blue box of size 53x36 starting at (85, 217).
; PLAN: r0=85(x), r1=217(y), r2=53(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 217
LDI r2, 53
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
