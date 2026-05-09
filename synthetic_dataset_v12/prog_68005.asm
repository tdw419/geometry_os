; DESCRIPTION: Composite: Draws a black line from (111, 55) to (323, 181) then Sets a single purple pixel at (143, 54).
; PLAN: r0=111(x1), r1=55(y1), r2=323(x2), r3=181(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=143(x), r6=54(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 111
LDI r1, 55
LDI r2, 323
LDI r3, 181
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 143
LDI r6, 54
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
