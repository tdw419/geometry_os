; DESCRIPTION: Composite: Creates a white rectangular region at (200, 9) spanning 60 by 109 pixels then Creates a orange circular shape at (311, 200) with radius 20.
; PLAN: r0=200(x), r1=9(y), r2=60(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=311(x), r6=200(y), r7=20(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 200
LDI r1, 9
LDI r2, 60
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 311
LDI r6, 200
LDI r7, 20
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
