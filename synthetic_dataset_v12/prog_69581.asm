; DESCRIPTION: Draws a blue line from (414, 97) to (473, 251).
; PLAN: r0=414(x1), r1=97(y1), r2=473(x2), r3=251(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 97
LDI r2, 473
LDI r3, 251
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
