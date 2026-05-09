; DESCRIPTION: Draws a purple line from (81, 175) to (363, 156).
; PLAN: r0=81(x1), r1=175(y1), r2=363(x2), r3=156(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 175
LDI r2, 363
LDI r3, 156
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
