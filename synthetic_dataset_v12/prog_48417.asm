; DESCRIPTION: Composite: Draws a yellow line from (361, 104) to (247, 33) then Sets a single yellow pixel at (385, 253).
; PLAN: r0=361(x1), r1=104(y1), r2=247(x2), r3=33(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=385(x), r6=253(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 361
LDI r1, 104
LDI r2, 247
LDI r3, 33
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 385
LDI r6, 253
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
