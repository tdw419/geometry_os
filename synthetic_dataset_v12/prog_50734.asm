; DESCRIPTION: Composite: Draws a green circle centered at (232, 92) with radius 65 then Creates a blue rectangular region at (24, 26) spanning 45 by 117 pixels.
; PLAN: r0=232(x), r1=92(y), r2=65(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=24(x), r6=26(y), r7=45(width), r8=117(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 232
LDI r1, 92
LDI r2, 65
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 24
LDI r6, 26
LDI r7, 45
LDI r8, 117
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
