; DESCRIPTION: Composite: Renders a purple disk with center (223, 161) and radius 71 then Creates a red rectangular region at (104, 70) spanning 87 by 49 pixels then Draws a red line from (456, 181) to (440, 214).
; PLAN: r0=223(x), r1=161(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=104(x), r6=70(y), r7=87(width), r8=49(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=456(x1), r11=181(y1), r12=440(x2), r13=214(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 223
LDI r1, 161
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 104
LDI r6, 70
LDI r7, 87
LDI r8, 49
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 456
LDI r11, 181
LDI r12, 440
LDI r13, 214
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
