; DESCRIPTION: Composite: Places a red line segment connecting (38, 60) to (62, 23) then Draws a orange circle centered at (251, 105) with radius 63 then Sets a single magenta pixel at (389, 26).
; PLAN: r0=38(x1), r1=60(y1), r2=62(x2), r3=23(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=251(x), r6=105(y), r7=63(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=389(x), r11=26(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 38
LDI r1, 60
LDI r2, 62
LDI r3, 23
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 251
LDI r6, 105
LDI r7, 63
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 389
LDI r11, 26
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
