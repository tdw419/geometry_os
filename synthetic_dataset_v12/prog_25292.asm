; DESCRIPTION: Composite: Draws a green line from (338, 160) to (287, 34) then Sets a single green pixel at (92, 142).
; PLAN: r0=338(x1), r1=160(y1), r2=287(x2), r3=34(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=92(x), r6=142(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 338
LDI r1, 160
LDI r2, 287
LDI r3, 34
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 92
LDI r6, 142
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
