; DESCRIPTION: Draws a purple line from (277, 116) to (140, 201).
; PLAN: r0=277(x1), r1=116(y1), r2=140(x2), r3=201(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 116
LDI r2, 140
LDI r3, 201
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
