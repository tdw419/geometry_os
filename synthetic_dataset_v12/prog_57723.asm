; DESCRIPTION: Draws a purple line from (203, 47) to (322, 244).
; PLAN: r0=203(x1), r1=47(y1), r2=322(x2), r3=244(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 47
LDI r2, 322
LDI r3, 244
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
