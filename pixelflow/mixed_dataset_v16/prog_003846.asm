; DESCRIPTION: Composite: Creates a white circular shape at (439, 78) with radius 20 then Places a white dot at position (351, 90) then Creates a orange rectangular region at (325, 194) spanning 56 by 14 pixels.
; PLAN: r0=439(x), r1=78(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=351(x), r6=90(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=325(x), r11=194(y), r12=56(width), r13=14(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 439
LDI r1, 78
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 351
LDI r6, 90
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 325
LDI r11, 194
LDI r12, 56
LDI r13, 14
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
