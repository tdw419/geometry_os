; DESCRIPTION: Draws a yellow line from (473, 102) to (444, 97).
; PLAN: r0=473(x1), r1=102(y1), r2=444(x2), r3=97(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 102
LDI r2, 444
LDI r3, 97
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
