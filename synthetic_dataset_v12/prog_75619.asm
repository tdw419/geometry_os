; DESCRIPTION: Composite: Sets a single cyan pixel at (468, 234) then Draws a black line from (448, 165) to (386, 227).
; PLAN: r0=468(x), r1=234(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=448(x1), r6=165(y1), r7=386(x2), r8=227(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 468
LDI r1, 234
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 448
LDI r6, 165
LDI r7, 386
LDI r8, 227
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
