; DESCRIPTION: Draws a purple line from (144, 72) to (229, 191).
; PLAN: r0=144(x1), r1=72(y1), r2=229(x2), r3=191(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 72
LDI r2, 229
LDI r3, 191
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
