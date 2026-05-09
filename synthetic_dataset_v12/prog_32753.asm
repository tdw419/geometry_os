; DESCRIPTION: Composite: Places a black line segment connecting (106, 220) to (353, 125) then Sets a single magenta pixel at (306, 178) then Creates a green rectangular region at (199, 45) spanning 75 by 105 pixels.
; PLAN: r0=106(x1), r1=220(y1), r2=353(x2), r3=125(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=306(x), r6=178(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=199(x), r11=45(y), r12=75(width), r13=105(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 106
LDI r1, 220
LDI r2, 353
LDI r3, 125
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 306
LDI r6, 178
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 199
LDI r11, 45
LDI r12, 75
LDI r13, 105
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
