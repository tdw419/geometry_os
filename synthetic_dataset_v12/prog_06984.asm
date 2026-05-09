; DESCRIPTION: Composite: Creates a white rectangular region at (39, 87) spanning 46 by 34 pixels then Renders a white disk with center (343, 158) and radius 45.
; PLAN: r0=39(x), r1=87(y), r2=46(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=343(x), r6=158(y), r7=45(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 39
LDI r1, 87
LDI r2, 46
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 343
LDI r6, 158
LDI r7, 45
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
