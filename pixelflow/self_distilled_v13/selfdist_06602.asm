; DESCRIPTION: Draws a red line from (161, 170) to (201, 148).
; PLAN: r0=161(x1), r1=170(y1), r2=201(x2), r3=148(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 170
LDI r2, 201
LDI r3, 148
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
