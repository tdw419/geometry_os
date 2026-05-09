; DESCRIPTION: Draws a purple line from (192, 234) to (37, 75).
; PLAN: r0=192(x1), r1=234(y1), r2=37(x2), r3=75(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 234
LDI r2, 37
LDI r3, 75
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
