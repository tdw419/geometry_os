; DESCRIPTION: Composite: Places a white line segment connecting (396, 193) to (93, 8) then Sets a single orange pixel at (6, 36).
; PLAN: r0=396(x1), r1=193(y1), r2=93(x2), r3=8(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=6(x), r6=36(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 396
LDI r1, 193
LDI r2, 93
LDI r3, 8
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 6
LDI r6, 36
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
