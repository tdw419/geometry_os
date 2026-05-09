; DESCRIPTION: Composite: Renders a red disk with center (464, 91) and radius 11 then Creates a magenta rectangular region at (113, 140) spanning 30 by 84 pixels then Renders a blue line between points (104, 175) and (478, 164).
; PLAN: r0=464(x), r1=91(y), r2=11(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=113(x), r6=140(y), r7=30(width), r8=84(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=104(x1), r11=175(y1), r12=478(x2), r13=164(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 464
LDI r1, 91
LDI r2, 11
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 113
LDI r6, 140
LDI r7, 30
LDI r8, 84
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 104
LDI r11, 175
LDI r12, 478
LDI r13, 164
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
