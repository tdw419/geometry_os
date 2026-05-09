; DESCRIPTION: Composite: Places a purple line segment connecting (105, 233) to (226, 59) then Places a yellow dot at position (145, 210) then Creates a orange circular shape at (188, 211) with radius 26.
; PLAN: r0=105(x1), r1=233(y1), r2=226(x2), r3=59(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=145(x), r6=210(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=188(x), r11=211(y), r12=26(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 105
LDI r1, 233
LDI r2, 226
LDI r3, 59
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 145
LDI r6, 210
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 188
LDI r11, 211
LDI r12, 26
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
