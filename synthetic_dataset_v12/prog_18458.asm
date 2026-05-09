; DESCRIPTION: Composite: Draws a blue rectangle at (274, 128) with width 45 and height 22 then Creates a purple circular shape at (402, 87) with radius 45.
; PLAN: r0=274(x), r1=128(y), r2=45(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=402(x), r6=87(y), r7=45(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 274
LDI r1, 128
LDI r2, 45
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 87
LDI r7, 45
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
