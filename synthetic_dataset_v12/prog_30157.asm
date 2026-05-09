; DESCRIPTION: Composite: Creates a blue rectangular region at (321, 180) spanning 28 by 14 pixels then Draws a green circle centered at (230, 160) with radius 22.
; PLAN: r0=321(x), r1=180(y), r2=28(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=230(x), r6=160(y), r7=22(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 321
LDI r1, 180
LDI r2, 28
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 230
LDI r6, 160
LDI r7, 22
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
