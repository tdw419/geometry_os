; DESCRIPTION: Composite: Creates a white rectangular region at (68, 193) spanning 12 by 62 pixels then Creates a cyan circular shape at (103, 172) with radius 53 then Sets a single green pixel at (271, 200).
; PLAN: r0=68(x), r1=193(y), r2=12(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=103(x), r6=172(y), r7=53(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=271(x), r11=200(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 68
LDI r1, 193
LDI r2, 12
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 172
LDI r7, 53
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 271
LDI r11, 200
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
