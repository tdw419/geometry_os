; DESCRIPTION: Composite: Creates a green rectangular region at (460, 86) spanning 12 by 73 pixels then Draws a blue circle centered at (347, 194) with radius 58.
; PLAN: r0=460(x), r1=86(y), r2=12(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=347(x), r6=194(y), r7=58(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 460
LDI r1, 86
LDI r2, 12
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 347
LDI r6, 194
LDI r7, 58
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
