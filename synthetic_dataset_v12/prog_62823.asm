; DESCRIPTION: Draws a purple line from (218, 142) to (357, 39).
; PLAN: r0=218(x1), r1=142(y1), r2=357(x2), r3=39(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 142
LDI r2, 357
LDI r3, 39
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
