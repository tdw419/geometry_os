; DESCRIPTION: Composite: Sets a single orange pixel at (444, 50) then Places a purple line segment connecting (403, 137) to (317, 176).
; PLAN: r0=444(x), r1=50(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=403(x1), r6=137(y1), r7=317(x2), r8=176(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 444
LDI r1, 50
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 403
LDI r6, 137
LDI r7, 317
LDI r8, 176
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
