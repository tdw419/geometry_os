; DESCRIPTION: Composite: Draws a purple circle centered at (442, 201) with radius 26 then Creates a green rectangular region at (243, 142) spanning 26 by 11 pixels then Draws a white line from (315, 11) to (355, 237).
; PLAN: r0=442(x), r1=201(y), r2=26(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=243(x), r6=142(y), r7=26(width), r8=11(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=315(x1), r11=11(y1), r12=355(x2), r13=237(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 442
LDI r1, 201
LDI r2, 26
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 243
LDI r6, 142
LDI r7, 26
LDI r8, 11
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 315
LDI r11, 11
LDI r12, 355
LDI r13, 237
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
