; DESCRIPTION: Draws a purple line from (358, 91) to (59, 80).
; PLAN: r0=358(x1), r1=91(y1), r2=59(x2), r3=80(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 91
LDI r2, 59
LDI r3, 80
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
