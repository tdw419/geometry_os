; DESCRIPTION: Composite: Renders a purple disk with center (163, 73) and radius 72 then Creates a green rectangular region at (396, 3) spanning 69 by 84 pixels.
; PLAN: r0=163(x), r1=73(y), r2=72(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=396(x), r6=3(y), r7=69(width), r8=84(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 163
LDI r1, 73
LDI r2, 72
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 396
LDI r6, 3
LDI r7, 69
LDI r8, 84
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
