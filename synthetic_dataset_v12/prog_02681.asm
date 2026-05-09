; DESCRIPTION: Draws a yellow line from (155, 153) to (473, 26).
; PLAN: r0=155(x1), r1=153(y1), r2=473(x2), r3=26(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 153
LDI r2, 473
LDI r3, 26
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
