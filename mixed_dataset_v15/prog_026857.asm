; DESCRIPTION: Composite: Sets a single black pixel at (164, 200) then Draws a green line from (64, 165) to (432, 183).
; PLAN: r0=164(x), r1=200(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=64(x1), r6=165(y1), r7=432(x2), r8=183(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 164
LDI r1, 200
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 64
LDI r6, 165
LDI r7, 432
LDI r8, 183
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
