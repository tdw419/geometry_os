; DESCRIPTION: Composite: Draws a green line from (53, 58) to (232, 171) then Sets a single black pixel at (489, 77).
; PLAN: r0=53(x1), r1=58(y1), r2=232(x2), r3=171(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=489(x), r6=77(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 53
LDI r1, 58
LDI r2, 232
LDI r3, 171
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 489
LDI r6, 77
LDI r7, 0x000000
PSET r5, r6, r7
HALT
