; DESCRIPTION: Composite: Creates a blue rectangular region at (144, 90) spanning 38 by 21 pixels then Places a black circle of radius 10 at center (318, 58).
; PLAN: r0=144(x), r1=90(y), r2=38(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=318(x), r6=58(y), r7=10(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 144
LDI r1, 90
LDI r2, 38
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 318
LDI r6, 58
LDI r7, 10
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
