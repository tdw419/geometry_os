; DESCRIPTION: Composite: Creates a white circular shape at (326, 163) with radius 46 then Creates a green rectangular region at (119, 13) spanning 102 by 34 pixels then Places a black dot at position (37, 61).
; PLAN: r0=326(x), r1=163(y), r2=46(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=119(x), r6=13(y), r7=102(width), r8=34(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=37(x), r11=61(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 326
LDI r1, 163
LDI r2, 46
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 119
LDI r6, 13
LDI r7, 102
LDI r8, 34
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 37
LDI r11, 61
LDI r12, 0x000000
PSET r10, r11, r12
HALT
