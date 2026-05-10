; DESCRIPTION: Draws a purple line from (438, 83) to (98, 202).
; PLAN: r0=438(x1), r1=83(y1), r2=98(x2), r3=202(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 83
LDI r2, 98
LDI r3, 202
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
