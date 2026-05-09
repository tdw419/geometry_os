; DESCRIPTION: Draws a yellow line from (16, 190) to (201, 35).
; PLAN: r0=16(x1), r1=190(y1), r2=201(x2), r3=35(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 190
LDI r2, 201
LDI r3, 35
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
