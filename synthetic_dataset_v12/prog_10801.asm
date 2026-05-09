; DESCRIPTION: Composite: Sets a single cyan pixel at (172, 142) then Creates a blue rectangular region at (35, 144) spanning 44 by 89 pixels then Draws a white line from (34, 200) to (315, 148).
; PLAN: r0=172(x), r1=142(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=35(x), r6=144(y), r7=44(width), r8=89(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=34(x1), r11=200(y1), r12=315(x2), r13=148(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 172
LDI r1, 142
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 35
LDI r6, 144
LDI r7, 44
LDI r8, 89
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 34
LDI r11, 200
LDI r12, 315
LDI r13, 148
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
