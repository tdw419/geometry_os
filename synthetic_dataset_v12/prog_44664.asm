; DESCRIPTION: Draws a purple line from (13, 225) to (418, 31).
; PLAN: r0=13(x1), r1=225(y1), r2=418(x2), r3=31(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 225
LDI r2, 418
LDI r3, 31
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
