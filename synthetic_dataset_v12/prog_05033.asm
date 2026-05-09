; DESCRIPTION: Draws a purple line from (282, 193) to (211, 89).
; PLAN: r0=282(x1), r1=193(y1), r2=211(x2), r3=89(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 193
LDI r2, 211
LDI r3, 89
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
