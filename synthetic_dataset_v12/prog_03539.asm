; DESCRIPTION: Composite: Places a magenta circle of radius 74 at center (361, 149) then Draws a red line from (368, 227) to (133, 203) then Creates a white rectangular region at (375, 97) spanning 95 by 118 pixels.
; PLAN: r0=361(x), r1=149(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=368(x1), r6=227(y1), r7=133(x2), r8=203(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=375(x), r11=97(y), r12=95(width), r13=118(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 361
LDI r1, 149
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 368
LDI r6, 227
LDI r7, 133
LDI r8, 203
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 375
LDI r11, 97
LDI r12, 95
LDI r13, 118
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
