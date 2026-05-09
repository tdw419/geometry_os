; DESCRIPTION: Composite: Creates a green circular shape at (342, 198) with radius 58 then Draws a purple rectangle at (48, 40) with width 17 and height 83.
; PLAN: r0=342(x), r1=198(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=48(x), r6=40(y), r7=17(width), r8=83(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 342
LDI r1, 198
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 48
LDI r6, 40
LDI r7, 17
LDI r8, 83
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
