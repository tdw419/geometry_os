; DESCRIPTION: Composite: Draws a white circle centered at (183, 56) with radius 39 then Creates a cyan rectangular region at (156, 1) spanning 78 by 105 pixels.
; PLAN: r0=183(x), r1=56(y), r2=39(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=156(x), r6=1(y), r7=78(width), r8=105(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 183
LDI r1, 56
LDI r2, 39
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 156
LDI r6, 1
LDI r7, 78
LDI r8, 105
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
