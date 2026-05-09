; DESCRIPTION: Composite: Sets a single orange pixel at (219, 200) then Creates a blue rectangular region at (385, 110) spanning 30 by 99 pixels then Places a green line segment connecting (96, 174) to (367, 85).
; PLAN: r0=219(x), r1=200(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=385(x), r6=110(y), r7=30(width), r8=99(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=96(x1), r11=174(y1), r12=367(x2), r13=85(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 219
LDI r1, 200
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 385
LDI r6, 110
LDI r7, 30
LDI r8, 99
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 96
LDI r11, 174
LDI r12, 367
LDI r13, 85
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
