; DESCRIPTION: Draws a blue line from (201, 10) to (323, 93).
; PLAN: r0=201(x1), r1=10(y1), r2=323(x2), r3=93(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 10
LDI r2, 323
LDI r3, 93
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
