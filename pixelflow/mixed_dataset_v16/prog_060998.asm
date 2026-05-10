; DESCRIPTION: Composite: Draws a yellow line from (379, 176) to (490, 208) then Sets a single black pixel at (194, 59).
; PLAN: r0=379(x1), r1=176(y1), r2=490(x2), r3=208(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=194(x), r6=59(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 379
LDI r1, 176
LDI r2, 490
LDI r3, 208
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 194
LDI r6, 59
LDI r7, 0x000000
PSET r5, r6, r7
HALT
