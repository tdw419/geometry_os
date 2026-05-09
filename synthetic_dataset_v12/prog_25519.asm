; DESCRIPTION: Draws a yellow line from (159, 84) to (311, 200).
; PLAN: r0=159(x1), r1=84(y1), r2=311(x2), r3=200(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 84
LDI r2, 311
LDI r3, 200
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
