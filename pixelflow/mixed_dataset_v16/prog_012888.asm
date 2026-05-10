; DESCRIPTION: Draws a purple line from (361, 199) to (301, 79).
; PLAN: r0=361(x1), r1=199(y1), r2=301(x2), r3=79(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 199
LDI r2, 301
LDI r3, 79
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
