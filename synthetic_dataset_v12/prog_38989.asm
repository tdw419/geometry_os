; DESCRIPTION: Draws a black line from (201, 155) to (227, 243).
; PLAN: r0=201(x1), r1=155(y1), r2=227(x2), r3=243(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 155
LDI r2, 227
LDI r3, 243
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
