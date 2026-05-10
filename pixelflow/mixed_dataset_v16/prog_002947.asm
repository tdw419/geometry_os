; DESCRIPTION: Composite: Places a yellow dot at position (287, 225) then Draws a blue line from (28, 50) to (316, 211).
; PLAN: r0=287(x), r1=225(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=28(x1), r6=50(y1), r7=316(x2), r8=211(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 287
LDI r1, 225
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 28
LDI r6, 50
LDI r7, 316
LDI r8, 211
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
