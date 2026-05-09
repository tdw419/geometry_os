; DESCRIPTION: Composite: Renders a magenta line between points (432, 79) and (468, 185) then Creates a orange circular shape at (371, 160) with radius 40.
; PLAN: r0=432(x1), r1=79(y1), r2=468(x2), r3=185(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=371(x), r6=160(y), r7=40(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 432
LDI r1, 79
LDI r2, 468
LDI r3, 185
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 371
LDI r6, 160
LDI r7, 40
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
