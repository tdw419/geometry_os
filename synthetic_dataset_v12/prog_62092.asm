; DESCRIPTION: Composite: Creates a cyan circular shape at (146, 87) with radius 28 then Creates a white rectangular region at (83, 106) spanning 49 by 17 pixels.
; PLAN: r0=146(x), r1=87(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=83(x), r6=106(y), r7=49(width), r8=17(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 146
LDI r1, 87
LDI r2, 28
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 83
LDI r6, 106
LDI r7, 49
LDI r8, 17
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
