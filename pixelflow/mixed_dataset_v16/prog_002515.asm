; DESCRIPTION: Composite: Renders a green line between points (323, 104) and (5, 45) then Creates a magenta rectangular region at (373, 35) spanning 110 by 116 pixels then Draws a white circle centered at (292, 136) with radius 53.
; PLAN: r0=323(x1), r1=104(y1), r2=5(x2), r3=45(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=373(x), r6=35(y), r7=110(width), r8=116(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=292(x), r11=136(y), r12=53(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 323
LDI r1, 104
LDI r2, 5
LDI r3, 45
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 373
LDI r6, 35
LDI r7, 110
LDI r8, 116
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 292
LDI r11, 136
LDI r12, 53
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
