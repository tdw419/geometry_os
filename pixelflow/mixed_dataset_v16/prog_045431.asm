; DESCRIPTION: Composite: Draws a purple line from (461, 104) to (80, 107) then Places a magenta circle of radius 49 at center (188, 181) then Draws a white rectangle at (292, 0) with width 107 and height 70.
; PLAN: r0=461(x1), r1=104(y1), r2=80(x2), r3=107(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=188(x), r6=181(y), r7=49(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=292(x), r11=0(y), r12=107(width), r13=70(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 461
LDI r1, 104
LDI r2, 80
LDI r3, 107
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 188
LDI r6, 181
LDI r7, 49
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 292
LDI r11, 0
LDI r12, 107
LDI r13, 70
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
