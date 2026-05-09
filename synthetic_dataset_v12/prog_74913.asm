; DESCRIPTION: Draws a purple line from (272, 216) to (265, 77).
; PLAN: r0=272(x1), r1=216(y1), r2=265(x2), r3=77(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 216
LDI r2, 265
LDI r3, 77
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
