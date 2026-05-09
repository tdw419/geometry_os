; DESCRIPTION: Draws a purple line from (177, 250) to (143, 181).
; PLAN: r0=177(x1), r1=250(y1), r2=143(x2), r3=181(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 250
LDI r2, 143
LDI r3, 181
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
