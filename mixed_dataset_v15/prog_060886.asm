; DESCRIPTION: Composite: Creates a blue rectangular region at (180, 8) spanning 22 by 43 pixels then Draws a purple circle centered at (270, 115) with radius 75.
; PLAN: r0=180(x), r1=8(y), r2=22(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=270(x), r6=115(y), r7=75(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 180
LDI r1, 8
LDI r2, 22
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 270
LDI r6, 115
LDI r7, 75
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
