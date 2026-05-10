; DESCRIPTION: Composite: Sets a single orange pixel at (429, 110) then Places a purple line segment connecting (373, 188) to (206, 179).
; PLAN: r0=429(x), r1=110(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=373(x1), r6=188(y1), r7=206(x2), r8=179(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 429
LDI r1, 110
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 373
LDI r6, 188
LDI r7, 206
LDI r8, 179
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
