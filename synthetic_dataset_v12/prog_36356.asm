; DESCRIPTION: Composite: Places a black dot at position (448, 74) then Draws a purple line from (456, 251) to (215, 77).
; PLAN: r0=448(x), r1=74(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=456(x1), r6=251(y1), r7=215(x2), r8=77(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 448
LDI r1, 74
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 456
LDI r6, 251
LDI r7, 215
LDI r8, 77
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
