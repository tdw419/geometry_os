; DESCRIPTION: Draws a purple line from (197, 215) to (83, 201).
; PLAN: r0=197(x1), r1=215(y1), r2=83(x2), r3=201(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 215
LDI r2, 83
LDI r3, 201
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
