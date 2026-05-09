; DESCRIPTION: Draws a yellow line from (81, 39) to (110, 201).
; PLAN: r0=81(x1), r1=39(y1), r2=110(x2), r3=201(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 39
LDI r2, 110
LDI r3, 201
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
