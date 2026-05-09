; DESCRIPTION: Composite: Places a purple line segment connecting (145, 6) to (423, 10) then Places a black dot at position (178, 147).
; PLAN: r0=145(x1), r1=6(y1), r2=423(x2), r3=10(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=178(x), r6=147(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 145
LDI r1, 6
LDI r2, 423
LDI r3, 10
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 178
LDI r6, 147
LDI r7, 0x000000
PSET r5, r6, r7
HALT
