; DESCRIPTION: Composite: Sets a single purple pixel at (477, 155) then Places a black line segment connecting (142, 19) to (357, 111).
; PLAN: r0=477(x), r1=155(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=142(x1), r6=19(y1), r7=357(x2), r8=111(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 477
LDI r1, 155
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 142
LDI r6, 19
LDI r7, 357
LDI r8, 111
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
