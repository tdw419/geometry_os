; DESCRIPTION: Renders a purple box of size 17x93 starting at (155, 34).
; PLAN: r0=155(x), r1=34(y), r2=17(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 34
LDI r2, 17
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
