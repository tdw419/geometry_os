; DESCRIPTION: Draws a purple line from (299, 26) to (143, 201).
; PLAN: r0=299(x1), r1=26(y1), r2=143(x2), r3=201(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 26
LDI r2, 143
LDI r3, 201
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
