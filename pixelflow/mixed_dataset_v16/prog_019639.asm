; DESCRIPTION: Composite: Creates a orange circular shape at (364, 86) with radius 63 then Creates a blue rectangular region at (97, 6) spanning 73 by 97 pixels.
; PLAN: r0=364(x), r1=86(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=97(x), r6=6(y), r7=73(width), r8=97(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 364
LDI r1, 86
LDI r2, 63
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 97
LDI r6, 6
LDI r7, 73
LDI r8, 97
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
