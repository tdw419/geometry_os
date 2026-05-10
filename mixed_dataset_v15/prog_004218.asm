; DESCRIPTION: Composite: Creates a magenta rectangular region at (233, 24) spanning 48 by 65 pixels then Places a purple line segment connecting (114, 114) to (287, 120) then Renders a orange disk with center (248, 136) and radius 76.
; PLAN: r0=233(x), r1=24(y), r2=48(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=114(x1), r6=114(y1), r7=287(x2), r8=120(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=248(x), r11=136(y), r12=76(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 233
LDI r1, 24
LDI r2, 48
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 114
LDI r6, 114
LDI r7, 287
LDI r8, 120
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 248
LDI r11, 136
LDI r12, 76
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
