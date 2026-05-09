; DESCRIPTION: Draws a purple line from (178, 44) to (358, 31).
; PLAN: r0=178(x1), r1=44(y1), r2=358(x2), r3=31(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 44
LDI r2, 358
LDI r3, 31
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
