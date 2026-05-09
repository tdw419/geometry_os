; DESCRIPTION: Composite: Draws a yellow line from (369, 211) to (468, 25) then Places a purple dot at position (304, 7).
; PLAN: r0=369(x1), r1=211(y1), r2=468(x2), r3=25(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=304(x), r6=7(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 369
LDI r1, 211
LDI r2, 468
LDI r3, 25
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 304
LDI r6, 7
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
