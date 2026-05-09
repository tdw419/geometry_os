; DESCRIPTION: Composite: Creates a white rectangular region at (265, 33) spanning 85 by 44 pixels then Creates a red circular shape at (422, 69) with radius 51.
; PLAN: r0=265(x), r1=33(y), r2=85(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=422(x), r6=69(y), r7=51(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 265
LDI r1, 33
LDI r2, 85
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 422
LDI r6, 69
LDI r7, 51
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
