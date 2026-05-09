; DESCRIPTION: Composite: Draws a white line from (497, 175) to (14, 233) then Sets a single orange pixel at (194, 80).
; PLAN: r0=497(x1), r1=175(y1), r2=14(x2), r3=233(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=194(x), r6=80(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 497
LDI r1, 175
LDI r2, 14
LDI r3, 233
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 194
LDI r6, 80
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
