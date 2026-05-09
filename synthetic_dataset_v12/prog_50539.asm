; DESCRIPTION: Draws a purple line from (431, 83) to (326, 47).
; PLAN: r0=431(x1), r1=83(y1), r2=326(x2), r3=47(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 83
LDI r2, 326
LDI r3, 47
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
