; DESCRIPTION: Renders a purple box of size 53x20 starting at (84, 81).
; PLAN: r0=84(x), r1=81(y), r2=53(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 81
LDI r2, 53
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
