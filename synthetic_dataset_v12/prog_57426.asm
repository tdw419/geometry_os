; DESCRIPTION: Draws a purple line from (97, 226) to (125, 201).
; PLAN: r0=97(x1), r1=226(y1), r2=125(x2), r3=201(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 226
LDI r2, 125
LDI r3, 201
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
