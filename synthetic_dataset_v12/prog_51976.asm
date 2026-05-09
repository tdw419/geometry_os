; DESCRIPTION: Composite: Creates a purple circular shape at (297, 83) with radius 49 then Draws a blue rectangle at (139, 86) with width 105 and height 80.
; PLAN: r0=297(x), r1=83(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=139(x), r6=86(y), r7=105(width), r8=80(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 297
LDI r1, 83
LDI r2, 49
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 139
LDI r6, 86
LDI r7, 105
LDI r8, 80
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
