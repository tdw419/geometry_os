; DESCRIPTION: Composite: Creates a white circular shape at (323, 97) with radius 75 then Draws a white line from (84, 252) to (429, 79).
; PLAN: r0=323(x), r1=97(y), r2=75(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=84(x1), r6=252(y1), r7=429(x2), r8=79(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 323
LDI r1, 97
LDI r2, 75
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 84
LDI r6, 252
LDI r7, 429
LDI r8, 79
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
