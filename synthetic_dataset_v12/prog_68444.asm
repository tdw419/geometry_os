; DESCRIPTION: Draws a yellow line from (6, 247) to (20, 201).
; PLAN: r0=6(x1), r1=247(y1), r2=20(x2), r3=201(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 247
LDI r2, 20
LDI r3, 201
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
