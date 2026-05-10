; DESCRIPTION: Composite: Creates a white circular shape at (344, 110) with radius 79 then Creates a magenta rectangular region at (189, 236) spanning 11 by 19 pixels.
; PLAN: r0=344(x), r1=110(y), r2=79(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=189(x), r6=236(y), r7=11(width), r8=19(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 344
LDI r1, 110
LDI r2, 79
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 189
LDI r6, 236
LDI r7, 11
LDI r8, 19
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
