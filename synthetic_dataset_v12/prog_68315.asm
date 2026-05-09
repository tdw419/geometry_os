; DESCRIPTION: Composite: Places a cyan line segment connecting (258, 12) to (511, 51) then Sets a single green pixel at (487, 76) then Creates a black circular shape at (423, 127) with radius 46.
; PLAN: r0=258(x1), r1=12(y1), r2=511(x2), r3=51(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=487(x), r6=76(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=423(x), r11=127(y), r12=46(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 258
LDI r1, 12
LDI r2, 511
LDI r3, 51
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 487
LDI r6, 76
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 423
LDI r11, 127
LDI r12, 46
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
