; DESCRIPTION: Composite: . Then Renders a black box of size 83x58 starting at (159, 155). Then Draws a purple circle centered at (163, 116) with radius 70.
; PLAN: r0=159(x), r1=155(y), r2=83(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=163(x), r1=116(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a black box of size 83x58 starting at (159, 155).
; PLAN: r0=159(x), r1=155(y), r2=83(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 155
LDI r2, 83
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple circle centered at (163, 116) with radius 70.
; PLAN: r0=163(x), r1=116(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 116
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
