; DESCRIPTION: Draws a yellow line from (201, 145) to (293, 101).
; PLAN: r0=201(x1), r1=145(y1), r2=293(x2), r3=101(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 145
LDI r2, 293
LDI r3, 101
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
