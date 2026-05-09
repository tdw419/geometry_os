; DESCRIPTION: Composite: Creates a orange circular shape at (159, 46) with radius 17 then Creates a cyan rectangular region at (353, 173) spanning 23 by 48 pixels.
; PLAN: r0=159(x), r1=46(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=353(x), r6=173(y), r7=23(width), r8=48(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 159
LDI r1, 46
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 353
LDI r6, 173
LDI r7, 23
LDI r8, 48
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
