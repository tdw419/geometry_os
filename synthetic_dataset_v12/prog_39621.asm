; DESCRIPTION: Composite: Draws a white line from (162, 45) to (478, 138) then Renders a red disk with center (390, 107) and radius 68 then Renders a purple box of size 100x110 starting at (163, 109).
; PLAN: r0=162(x1), r1=45(y1), r2=478(x2), r3=138(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=390(x), r6=107(y), r7=68(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=163(x), r11=109(y), r12=100(width), r13=110(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 162
LDI r1, 45
LDI r2, 478
LDI r3, 138
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 390
LDI r6, 107
LDI r7, 68
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 163
LDI r11, 109
LDI r12, 100
LDI r13, 110
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
