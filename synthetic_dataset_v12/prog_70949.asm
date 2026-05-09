; DESCRIPTION: Composite: Creates a white circular shape at (213, 130) with radius 31 then Creates a magenta rectangular region at (331, 110) spanning 19 by 35 pixels.
; PLAN: r0=213(x), r1=130(y), r2=31(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=331(x), r6=110(y), r7=19(width), r8=35(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 213
LDI r1, 130
LDI r2, 31
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 331
LDI r6, 110
LDI r7, 19
LDI r8, 35
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
