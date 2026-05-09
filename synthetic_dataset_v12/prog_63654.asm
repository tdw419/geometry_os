; DESCRIPTION: Composite: Creates a white rectangular region at (9, 21) spanning 22 by 44 pixels then Draws a yellow circle centered at (263, 176) with radius 65.
; PLAN: r0=9(x), r1=21(y), r2=22(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=263(x), r6=176(y), r7=65(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 9
LDI r1, 21
LDI r2, 22
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 263
LDI r6, 176
LDI r7, 65
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
