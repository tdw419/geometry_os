; DESCRIPTION: Draws a purple line from (363, 30) to (283, 81).
; PLAN: r0=363(x1), r1=30(y1), r2=283(x2), r3=81(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 30
LDI r2, 283
LDI r3, 81
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
