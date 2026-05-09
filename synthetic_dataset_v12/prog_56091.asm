; DESCRIPTION: Composite: Places a yellow line segment connecting (342, 54) to (444, 218) then Creates a orange circular shape at (277, 185) with radius 56 then Sets a single purple pixel at (488, 79).
; PLAN: r0=342(x1), r1=54(y1), r2=444(x2), r3=218(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=277(x), r6=185(y), r7=56(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=488(x), r11=79(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 342
LDI r1, 54
LDI r2, 444
LDI r3, 218
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 277
LDI r6, 185
LDI r7, 56
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 488
LDI r11, 79
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
