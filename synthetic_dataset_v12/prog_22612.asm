; DESCRIPTION: Composite: Draws a white rectangle at (318, 224) with width 23 and height 10 then Creates a cyan circular shape at (284, 119) with radius 64.
; PLAN: r0=318(x), r1=224(y), r2=23(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=284(x), r6=119(y), r7=64(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 318
LDI r1, 224
LDI r2, 23
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 284
LDI r6, 119
LDI r7, 64
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
