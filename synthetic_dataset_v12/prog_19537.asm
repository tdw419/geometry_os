; DESCRIPTION: Draws a purple line from (393, 227) to (137, 46).
; PLAN: r0=393(x1), r1=227(y1), r2=137(x2), r3=46(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 227
LDI r2, 137
LDI r3, 46
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
