; DESCRIPTION: Composite: Draws a red rectangle at (29, 117) with width 112 and height 24 then Draws a purple circle centered at (442, 103) with radius 19.
; PLAN: r0=29(x), r1=117(y), r2=112(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=442(x), r6=103(y), r7=19(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 29
LDI r1, 117
LDI r2, 112
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 442
LDI r6, 103
LDI r7, 19
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
