; DESCRIPTION: Draws a purple line from (124, 132) to (83, 197).
; PLAN: r0=124(x1), r1=132(y1), r2=83(x2), r3=197(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 132
LDI r2, 83
LDI r3, 197
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
