; DESCRIPTION: Composite: Creates a white circular shape at (275, 105) with radius 33 then Creates a magenta rectangular region at (209, 30) spanning 35 by 90 pixels.
; PLAN: r0=275(x), r1=105(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=209(x), r6=30(y), r7=35(width), r8=90(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 275
LDI r1, 105
LDI r2, 33
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 209
LDI r6, 30
LDI r7, 35
LDI r8, 90
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
