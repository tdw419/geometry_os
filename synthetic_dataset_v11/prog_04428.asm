; DESCRIPTION: Renders a purple box of size 81x43 starting at (85, 104).
; PLAN: r0=85(x), r1=104(y), r2=81(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 104
LDI r2, 81
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
