; DESCRIPTION: Draws a red line from (119, 108) to (201, 13).
; PLAN: r0=119(x1), r1=108(y1), r2=201(x2), r3=13(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 108
LDI r2, 201
LDI r3, 13
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
