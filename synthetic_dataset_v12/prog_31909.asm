; DESCRIPTION: Draws a purple line from (279, 143) to (318, 46).
; PLAN: r0=279(x1), r1=143(y1), r2=318(x2), r3=46(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 143
LDI r2, 318
LDI r3, 46
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
