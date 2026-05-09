; DESCRIPTION: Composite: Creates a magenta rectangular region at (374, 167) spanning 105 by 80 pixels then Draws a blue circle centered at (180, 123) with radius 55.
; PLAN: r0=374(x), r1=167(y), r2=105(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=180(x), r6=123(y), r7=55(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 374
LDI r1, 167
LDI r2, 105
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 180
LDI r6, 123
LDI r7, 55
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
