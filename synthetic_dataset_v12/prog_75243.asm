; DESCRIPTION: Composite: Draws a white circle centered at (360, 141) with radius 14 then Creates a magenta rectangular region at (371, 19) spanning 98 by 13 pixels then Renders a magenta line between points (358, 251) and (335, 211).
; PLAN: r0=360(x), r1=141(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=371(x), r6=19(y), r7=98(width), r8=13(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=358(x1), r11=251(y1), r12=335(x2), r13=211(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 360
LDI r1, 141
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 371
LDI r6, 19
LDI r7, 98
LDI r8, 13
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 358
LDI r11, 251
LDI r12, 335
LDI r13, 211
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
