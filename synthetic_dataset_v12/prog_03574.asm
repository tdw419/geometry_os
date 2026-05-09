; DESCRIPTION: Composite: Draws a purple line from (390, 165) to (508, 199) then Renders a green box of size 101x93 starting at (317, 111) then Renders a purple disk with center (199, 142) and radius 69.
; PLAN: r0=390(x1), r1=165(y1), r2=508(x2), r3=199(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=317(x), r6=111(y), r7=101(width), r8=93(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=199(x), r11=142(y), r12=69(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 390
LDI r1, 165
LDI r2, 508
LDI r3, 199
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 317
LDI r6, 111
LDI r7, 101
LDI r8, 93
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 199
LDI r11, 142
LDI r12, 69
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
