; DESCRIPTION: Composite: Draws a green line from (462, 51) to (431, 115) then Creates a yellow rectangular region at (277, 124) spanning 110 by 34 pixels then Creates a blue circular shape at (186, 145) with radius 51.
; PLAN: r0=462(x1), r1=51(y1), r2=431(x2), r3=115(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=277(x), r6=124(y), r7=110(width), r8=34(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=186(x), r11=145(y), r12=51(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 462
LDI r1, 51
LDI r2, 431
LDI r3, 115
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 277
LDI r6, 124
LDI r7, 110
LDI r8, 34
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 186
LDI r11, 145
LDI r12, 51
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
