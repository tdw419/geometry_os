; DESCRIPTION: Renders a purple box of size 83x14 starting at (155, 139).
; PLAN: r0=155(x), r1=139(y), r2=83(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 139
LDI r2, 83
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
