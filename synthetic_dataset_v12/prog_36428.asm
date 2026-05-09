; DESCRIPTION: Composite: Sets a single purple pixel at (287, 75) then Draws a green line from (223, 20) to (376, 39).
; PLAN: r0=287(x), r1=75(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=223(x1), r6=20(y1), r7=376(x2), r8=39(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 287
LDI r1, 75
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 223
LDI r6, 20
LDI r7, 376
LDI r8, 39
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
