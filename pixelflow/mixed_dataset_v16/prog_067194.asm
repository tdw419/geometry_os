; DESCRIPTION: Composite: Places a black line segment connecting (501, 103) to (135, 185) then Sets a single red pixel at (321, 112).
; PLAN: r0=501(x1), r1=103(y1), r2=135(x2), r3=185(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=321(x), r6=112(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 501
LDI r1, 103
LDI r2, 135
LDI r3, 185
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 321
LDI r6, 112
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
