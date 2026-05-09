; DESCRIPTION: Composite: Creates a yellow circular shape at (215, 84) with radius 79 then Creates a green rectangular region at (491, 31) spanning 21 by 43 pixels.
; PLAN: r0=215(x), r1=84(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=491(x), r6=31(y), r7=21(width), r8=43(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 215
LDI r1, 84
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 491
LDI r6, 31
LDI r7, 21
LDI r8, 43
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
