; DESCRIPTION: Composite: Draws a orange line from (274, 250) to (83, 115) then Sets a single black pixel at (154, 100).
; PLAN: r0=274(x1), r1=250(y1), r2=83(x2), r3=115(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=154(x), r6=100(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 274
LDI r1, 250
LDI r2, 83
LDI r3, 115
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 154
LDI r6, 100
LDI r7, 0x000000
PSET r5, r6, r7
HALT
