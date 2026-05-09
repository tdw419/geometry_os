; DESCRIPTION: Composite: Places a blue line segment connecting (226, 148) to (13, 219) then Sets a single white pixel at (438, 229).
; PLAN: r0=226(x1), r1=148(y1), r2=13(x2), r3=219(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=438(x), r6=229(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 226
LDI r1, 148
LDI r2, 13
LDI r3, 219
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 438
LDI r6, 229
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
