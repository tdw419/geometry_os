; DESCRIPTION: Composite: Creates a cyan circular shape at (228, 181) with radius 72 then Creates a cyan rectangular region at (347, 77) spanning 108 by 83 pixels.
; PLAN: r0=228(x), r1=181(y), r2=72(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=347(x), r6=77(y), r7=108(width), r8=83(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 228
LDI r1, 181
LDI r2, 72
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 347
LDI r6, 77
LDI r7, 108
LDI r8, 83
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
