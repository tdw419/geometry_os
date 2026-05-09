; DESCRIPTION: Composite: Sets a single black pixel at (464, 139) then Draws a orange line from (94, 157) to (417, 157).
; PLAN: r0=464(x), r1=139(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=94(x1), r6=157(y1), r7=417(x2), r8=157(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 464
LDI r1, 139
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 94
LDI r6, 157
LDI r7, 417
LDI r8, 157
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
