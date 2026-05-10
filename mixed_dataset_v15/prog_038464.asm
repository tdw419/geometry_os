; DESCRIPTION: Composite: Draws a cyan circle centered at (77, 90) with radius 69 then Creates a yellow rectangular region at (156, 123) spanning 100 by 18 pixels.
; PLAN: r0=77(x), r1=90(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=156(x), r6=123(y), r7=100(width), r8=18(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 77
LDI r1, 90
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 156
LDI r6, 123
LDI r7, 100
LDI r8, 18
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
