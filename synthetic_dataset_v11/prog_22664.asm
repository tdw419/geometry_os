; DESCRIPTION: Draws a purple line from (137, 149) to (83, 66).
; PLAN: r0=137(x1), r1=149(y1), r2=83(x2), r3=66(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 149
LDI r2, 83
LDI r3, 66
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
