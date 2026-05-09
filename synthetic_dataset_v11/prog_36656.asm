; DESCRIPTION: Draws a purple line from (36, 65) to (90, 249).
; PLAN: r0=36(x1), r1=65(y1), r2=90(x2), r3=249(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 65
LDI r2, 90
LDI r3, 249
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
