; DESCRIPTION: Composite: Draws a magenta circle centered at (423, 164) with radius 57 then Draws a purple rectangle at (172, 20) with width 18 and height 113 then Draws a red line from (411, 174) to (116, 141).
; PLAN: r0=423(x), r1=164(y), r2=57(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=172(x), r6=20(y), r7=18(width), r8=113(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=411(x1), r11=174(y1), r12=116(x2), r13=141(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 423
LDI r1, 164
LDI r2, 57
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 172
LDI r6, 20
LDI r7, 18
LDI r8, 113
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 411
LDI r11, 174
LDI r12, 116
LDI r13, 141
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
