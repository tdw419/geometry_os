; DESCRIPTION: Composite: Creates a white rectangular region at (332, 110) spanning 100 by 80 pixels then Creates a red circular shape at (440, 90) with radius 16.
; PLAN: r0=332(x), r1=110(y), r2=100(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=440(x), r6=90(y), r7=16(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 332
LDI r1, 110
LDI r2, 100
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 440
LDI r6, 90
LDI r7, 16
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
