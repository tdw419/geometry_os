; DESCRIPTION: Composite: Places a purple line segment connecting (217, 26) to (419, 216) then Sets a single orange pixel at (443, 7) then Creates a yellow rectangular region at (133, 69) spanning 54 by 70 pixels.
; PLAN: r0=217(x1), r1=26(y1), r2=419(x2), r3=216(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=443(x), r6=7(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=133(x), r11=69(y), r12=54(width), r13=70(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 217
LDI r1, 26
LDI r2, 419
LDI r3, 216
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 443
LDI r6, 7
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 133
LDI r11, 69
LDI r12, 54
LDI r13, 70
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
