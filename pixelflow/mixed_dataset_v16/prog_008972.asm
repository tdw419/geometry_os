; DESCRIPTION: Renders a purple box of size 17x57 starting at (62, 155).
; PLAN: r0=62(x), r1=155(y), r2=17(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 155
LDI r2, 17
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
