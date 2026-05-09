; DESCRIPTION: Draws a purple line from (218, 57) to (287, 232).
; PLAN: r0=218(x1), r1=57(y1), r2=287(x2), r3=232(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 57
LDI r2, 287
LDI r3, 232
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
