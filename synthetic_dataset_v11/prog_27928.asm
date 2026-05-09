; DESCRIPTION: Draws a blue line from (155, 211) to (189, 81).
; PLAN: r0=155(x1), r1=211(y1), r2=189(x2), r3=81(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 211
LDI r2, 189
LDI r3, 81
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
