; DESCRIPTION: Composite: Draws a green circle centered at (325, 182) with radius 46 then Draws a purple rectangle at (291, 13) with width 13 and height 86.
; PLAN: r0=325(x), r1=182(y), r2=46(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=291(x), r6=13(y), r7=13(width), r8=86(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 325
LDI r1, 182
LDI r2, 46
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 291
LDI r6, 13
LDI r7, 13
LDI r8, 86
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
