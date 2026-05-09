; DESCRIPTION: Renders a blue box of size 53x106 starting at (36, 61).
; PLAN: r0=36(x), r1=61(y), r2=53(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 61
LDI r2, 53
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
