; DESCRIPTION: Composite: Draws a blue line from (198, 36) to (262, 46) then Sets a single blue pixel at (47, 15).
; PLAN: r0=198(x1), r1=36(y1), r2=262(x2), r3=46(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=47(x), r6=15(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 198
LDI r1, 36
LDI r2, 262
LDI r3, 46
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 47
LDI r6, 15
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
