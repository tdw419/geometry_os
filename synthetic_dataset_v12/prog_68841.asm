; DESCRIPTION: Composite: Renders a orange disk with center (411, 113) and radius 61 then Creates a magenta rectangular region at (49, 73) spanning 95 by 106 pixels then Places a purple line segment connecting (338, 51) to (418, 63).
; PLAN: r0=411(x), r1=113(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=49(x), r6=73(y), r7=95(width), r8=106(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=338(x1), r11=51(y1), r12=418(x2), r13=63(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 411
LDI r1, 113
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 49
LDI r6, 73
LDI r7, 95
LDI r8, 106
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 338
LDI r11, 51
LDI r12, 418
LDI r13, 63
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
