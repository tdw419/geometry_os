; DESCRIPTION: Renders a purple box of size 96x88 starting at (139, 129).
; PLAN: r0=139(x), r1=129(y), r2=96(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 129
LDI r2, 96
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
