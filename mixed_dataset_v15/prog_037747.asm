; DESCRIPTION: Draws a purple line from (430, 62) to (236, 204).
; PLAN: r0=430(x1), r1=62(y1), r2=236(x2), r3=204(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 62
LDI r2, 236
LDI r3, 204
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
