; DESCRIPTION: Draws a purple line from (200, 99) to (210, 211).
; PLAN: r0=200(x1), r1=99(y1), r2=210(x2), r3=211(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 99
LDI r2, 210
LDI r3, 211
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
