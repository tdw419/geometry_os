; DESCRIPTION: Composite: Renders a white line between points (321, 125) and (182, 74) then Sets a single yellow pixel at (377, 26) then Creates a white circular shape at (70, 63) with radius 55.
; PLAN: r0=321(x1), r1=125(y1), r2=182(x2), r3=74(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=377(x), r6=26(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=70(x), r11=63(y), r12=55(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 321
LDI r1, 125
LDI r2, 182
LDI r3, 74
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 377
LDI r6, 26
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 70
LDI r11, 63
LDI r12, 55
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
