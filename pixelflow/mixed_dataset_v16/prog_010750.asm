; DESCRIPTION: Composite: Sets a single green pixel at (434, 80) then Draws a white line from (201, 131) to (324, 37).
; PLAN: r0=434(x), r1=80(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=201(x1), r6=131(y1), r7=324(x2), r8=37(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 434
LDI r1, 80
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 201
LDI r6, 131
LDI r7, 324
LDI r8, 37
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
