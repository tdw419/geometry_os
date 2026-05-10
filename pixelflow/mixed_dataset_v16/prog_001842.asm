; DESCRIPTION: Composite: Creates a green circular shape at (431, 109) with radius 11 then Creates a white rectangular region at (77, 53) spanning 28 by 31 pixels.
; PLAN: r0=431(x), r1=109(y), r2=11(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=77(x), r6=53(y), r7=28(width), r8=31(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 431
LDI r1, 109
LDI r2, 11
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 77
LDI r6, 53
LDI r7, 28
LDI r8, 31
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
