; DESCRIPTION: Composite: Creates a black circular shape at (334, 121) with radius 78 then Creates a cyan rectangular region at (265, 114) spanning 78 by 109 pixels.
; PLAN: r0=334(x), r1=121(y), r2=78(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=265(x), r6=114(y), r7=78(width), r8=109(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 334
LDI r1, 121
LDI r2, 78
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 265
LDI r6, 114
LDI r7, 78
LDI r8, 109
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
