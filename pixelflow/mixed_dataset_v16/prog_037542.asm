; DESCRIPTION: Composite: Creates a green rectangular region at (140, 26) spanning 47 by 104 pixels then Renders a black disk with center (431, 65) and radius 38.
; PLAN: r0=140(x), r1=26(y), r2=47(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=431(x), r6=65(y), r7=38(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 140
LDI r1, 26
LDI r2, 47
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 431
LDI r6, 65
LDI r7, 38
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
