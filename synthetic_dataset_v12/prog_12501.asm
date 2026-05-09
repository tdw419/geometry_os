; DESCRIPTION: Composite: Creates a red rectangular region at (310, 56) spanning 104 by 83 pixels then Renders a black disk with center (266, 112) and radius 56.
; PLAN: r0=310(x), r1=56(y), r2=104(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=266(x), r6=112(y), r7=56(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 310
LDI r1, 56
LDI r2, 104
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 112
LDI r7, 56
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
