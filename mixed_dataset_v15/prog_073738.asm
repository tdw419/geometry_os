; DESCRIPTION: Composite: Creates a white rectangular region at (315, 14) spanning 25 by 10 pixels then Places a green circle of radius 19 at center (299, 201).
; PLAN: r0=315(x), r1=14(y), r2=25(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=299(x), r6=201(y), r7=19(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 315
LDI r1, 14
LDI r2, 25
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 201
LDI r7, 19
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
