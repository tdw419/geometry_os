; DESCRIPTION: Composite: Creates a white rectangular region at (4, 23) spanning 69 by 80 pixels then Creates a green circular shape at (164, 161) with radius 71.
; PLAN: r0=4(x), r1=23(y), r2=69(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=164(x), r6=161(y), r7=71(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 4
LDI r1, 23
LDI r2, 69
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 164
LDI r6, 161
LDI r7, 71
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
