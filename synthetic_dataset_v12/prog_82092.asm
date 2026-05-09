; DESCRIPTION: Composite: Draws a green line from (311, 45) to (293, 48) then Sets a single yellow pixel at (463, 198) then Places a green circle of radius 33 at center (69, 47).
; PLAN: r0=311(x1), r1=45(y1), r2=293(x2), r3=48(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=463(x), r6=198(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=69(x), r11=47(y), r12=33(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 311
LDI r1, 45
LDI r2, 293
LDI r3, 48
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 463
LDI r6, 198
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 69
LDI r11, 47
LDI r12, 33
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
