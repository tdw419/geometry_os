; DESCRIPTION: Composite: Places a purple circle of radius 66 at center (97, 144) then Draws a purple line from (348, 139) to (429, 153).
; PLAN: r0=97(x), r1=144(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=348(x1), r6=139(y1), r7=429(x2), r8=153(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 97
LDI r1, 144
LDI r2, 66
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 348
LDI r6, 139
LDI r7, 429
LDI r8, 153
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
