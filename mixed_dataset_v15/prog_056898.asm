; DESCRIPTION: Composite: Sets a single orange pixel at (260, 48) then Places a orange line segment connecting (244, 25) to (383, 200).
; PLAN: r0=260(x), r1=48(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=244(x1), r6=25(y1), r7=383(x2), r8=200(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 260
LDI r1, 48
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 244
LDI r6, 25
LDI r7, 383
LDI r8, 200
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
