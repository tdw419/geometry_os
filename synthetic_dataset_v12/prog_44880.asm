; DESCRIPTION: Composite: Draws a black line from (493, 47) to (98, 50) then Sets a single blue pixel at (268, 233).
; PLAN: r0=493(x1), r1=47(y1), r2=98(x2), r3=50(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=268(x), r6=233(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 493
LDI r1, 47
LDI r2, 98
LDI r3, 50
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 268
LDI r6, 233
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
