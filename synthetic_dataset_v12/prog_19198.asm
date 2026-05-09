; DESCRIPTION: Composite: Places a white line segment connecting (201, 127) to (332, 226) then Sets a single orange pixel at (235, 145).
; PLAN: r0=201(x1), r1=127(y1), r2=332(x2), r3=226(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=235(x), r6=145(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 201
LDI r1, 127
LDI r2, 332
LDI r3, 226
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 235
LDI r6, 145
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
