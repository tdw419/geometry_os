; DESCRIPTION: Draws a blue line from (409, 57) to (314, 66).
; PLAN: r0=409(x1), r1=57(y1), r2=314(x2), r3=66(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 57
LDI r2, 314
LDI r3, 66
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
