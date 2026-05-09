; DESCRIPTION: Composite: Places a orange line segment connecting (95, 254) to (140, 166) then Sets a single white pixel at (353, 145).
; PLAN: r0=95(x1), r1=254(y1), r2=140(x2), r3=166(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=353(x), r6=145(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 95
LDI r1, 254
LDI r2, 140
LDI r3, 166
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 353
LDI r6, 145
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
