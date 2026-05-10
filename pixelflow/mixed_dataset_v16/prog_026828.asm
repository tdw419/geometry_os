; DESCRIPTION: Composite: Creates a cyan circular shape at (331, 155) with radius 79 then Places a orange line segment connecting (432, 214) to (275, 75) then Sets a single magenta pixel at (155, 33).
; PLAN: r0=331(x), r1=155(y), r2=79(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=432(x1), r6=214(y1), r7=275(x2), r8=75(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=155(x), r11=33(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 331
LDI r1, 155
LDI r2, 79
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 432
LDI r6, 214
LDI r7, 275
LDI r8, 75
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 155
LDI r11, 33
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
