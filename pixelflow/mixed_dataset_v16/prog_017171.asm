; DESCRIPTION: Composite: Draws a white circle centered at (257, 139) with radius 48 then Creates a orange rectangular region at (266, 54) spanning 104 by 109 pixels.
; PLAN: r0=257(x), r1=139(y), r2=48(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=266(x), r6=54(y), r7=104(width), r8=109(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 257
LDI r1, 139
LDI r2, 48
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 266
LDI r6, 54
LDI r7, 104
LDI r8, 109
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
