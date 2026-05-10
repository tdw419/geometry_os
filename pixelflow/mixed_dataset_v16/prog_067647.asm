; DESCRIPTION: Composite: Creates a orange circular shape at (364, 193) with radius 21 then Creates a red rectangular region at (1, 13) spanning 23 by 94 pixels.
; PLAN: r0=364(x), r1=193(y), r2=21(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=1(x), r6=13(y), r7=23(width), r8=94(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 364
LDI r1, 193
LDI r2, 21
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 1
LDI r6, 13
LDI r7, 23
LDI r8, 94
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
