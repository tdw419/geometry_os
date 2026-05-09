; DESCRIPTION: Draws a yellow line from (390, 207) to (153, 217).
; PLAN: r0=390(x1), r1=207(y1), r2=153(x2), r3=217(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 207
LDI r2, 153
LDI r3, 217
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
