; DESCRIPTION: Composite: . Then Creates a yellow circular shape at (62, 117) with radius 17. Then Draws a purple rectangle at (107, 150) with width 110 and height 81.
; PLAN: r0=62(x), r1=117(y), r2=17(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=107(x), r1=150(y), r2=110(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a yellow circular shape at (62, 117) with radius 17.
; PLAN: r0=62(x), r1=117(y), r2=17(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 117
LDI r2, 17
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a purple rectangle at (107, 150) with width 110 and height 81.
; PLAN: r0=107(x), r1=150(y), r2=110(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 150
LDI r2, 110
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
