; DESCRIPTION: Composite: Draws a red circle centered at (419, 58) with radius 51 then Draws a green line from (232, 30) to (185, 126).
; PLAN: r0=419(x), r1=58(y), r2=51(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=232(x1), r6=30(y1), r7=185(x2), r8=126(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 419
LDI r1, 58
LDI r2, 51
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 232
LDI r6, 30
LDI r7, 185
LDI r8, 126
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
