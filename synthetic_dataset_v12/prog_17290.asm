; DESCRIPTION: Composite: Sets a single green pixel at (397, 251) then Draws a black line from (169, 233) to (178, 150).
; PLAN: r0=397(x), r1=251(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=169(x1), r6=233(y1), r7=178(x2), r8=150(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 397
LDI r1, 251
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 169
LDI r6, 233
LDI r7, 178
LDI r8, 150
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
