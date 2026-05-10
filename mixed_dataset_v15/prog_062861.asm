; DESCRIPTION: Draws a purple line from (381, 226) to (363, 107).
; PLAN: r0=381(x1), r1=226(y1), r2=363(x2), r3=107(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 226
LDI r2, 363
LDI r3, 107
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
