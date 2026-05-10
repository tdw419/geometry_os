; DESCRIPTION: Composite: Draws a cyan circle centered at (444, 56) with radius 43 then Creates a white rectangular region at (384, 17) spanning 34 by 45 pixels.
; PLAN: r0=444(x), r1=56(y), r2=43(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=384(x), r6=17(y), r7=34(width), r8=45(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 444
LDI r1, 56
LDI r2, 43
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 384
LDI r6, 17
LDI r7, 34
LDI r8, 45
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
