; DESCRIPTION: Composite: Creates a black circular shape at (452, 83) with radius 52 then Creates a magenta rectangular region at (347, 35) spanning 109 by 45 pixels.
; PLAN: r0=452(x), r1=83(y), r2=52(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=347(x), r6=35(y), r7=109(width), r8=45(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 452
LDI r1, 83
LDI r2, 52
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 347
LDI r6, 35
LDI r7, 109
LDI r8, 45
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
