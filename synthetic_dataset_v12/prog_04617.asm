; DESCRIPTION: Draws a blue line from (418, 171) to (431, 205).
; PLAN: r0=418(x1), r1=171(y1), r2=431(x2), r3=205(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 171
LDI r2, 431
LDI r3, 205
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
