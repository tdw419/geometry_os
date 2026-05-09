; DESCRIPTION: Draws a yellow line from (500, 118) to (170, 131).
; PLAN: r0=500(x1), r1=118(y1), r2=170(x2), r3=131(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 118
LDI r2, 170
LDI r3, 131
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
