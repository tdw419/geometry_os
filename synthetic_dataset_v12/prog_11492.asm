; DESCRIPTION: Composite: Places a blue circle of radius 18 at center (121, 212) then Creates a black rectangular region at (398, 60) spanning 74 by 95 pixels then Draws a blue line from (233, 112) to (323, 68).
; PLAN: r0=121(x), r1=212(y), r2=18(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=398(x), r6=60(y), r7=74(width), r8=95(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=233(x1), r11=112(y1), r12=323(x2), r13=68(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 121
LDI r1, 212
LDI r2, 18
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 398
LDI r6, 60
LDI r7, 74
LDI r8, 95
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 233
LDI r11, 112
LDI r12, 323
LDI r13, 68
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
