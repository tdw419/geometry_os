; DESCRIPTION: Draws a white line from (359, 201) to (429, 188).
; PLAN: r0=359(x1), r1=201(y1), r2=429(x2), r3=188(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 201
LDI r2, 429
LDI r3, 188
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
