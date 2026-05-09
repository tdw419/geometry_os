; DESCRIPTION: Composite: Draws a blue rectangle at (251, 43) with width 45 and height 78 then Draws a purple circle centered at (382, 50) with radius 35.
; PLAN: r0=251(x), r1=43(y), r2=45(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=382(x), r6=50(y), r7=35(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 251
LDI r1, 43
LDI r2, 45
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 382
LDI r6, 50
LDI r7, 35
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
