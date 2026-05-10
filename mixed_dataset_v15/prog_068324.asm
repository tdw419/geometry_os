; DESCRIPTION: Composite: Creates a white rectangular region at (285, 135) spanning 23 by 74 pixels then Draws a red line from (261, 94) to (400, 174) then Renders a black disk with center (396, 160) and radius 75.
; PLAN: r0=285(x), r1=135(y), r2=23(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=261(x1), r6=94(y1), r7=400(x2), r8=174(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=396(x), r11=160(y), r12=75(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 285
LDI r1, 135
LDI r2, 23
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 261
LDI r6, 94
LDI r7, 400
LDI r8, 174
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 396
LDI r11, 160
LDI r12, 75
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
