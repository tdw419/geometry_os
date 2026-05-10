; DESCRIPTION: Composite: Creates a cyan rectangular region at (286, 126) spanning 105 by 94 pixels then Creates a yellow circular shape at (299, 22) with radius 15.
; PLAN: r0=286(x), r1=126(y), r2=105(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=299(x), r6=22(y), r7=15(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 286
LDI r1, 126
LDI r2, 105
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 22
LDI r7, 15
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
