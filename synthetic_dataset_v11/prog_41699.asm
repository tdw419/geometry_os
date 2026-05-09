; DESCRIPTION: Draws a green line from (155, 137) to (131, 200).
; PLAN: r0=155(x1), r1=137(y1), r2=131(x2), r3=200(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 137
LDI r2, 131
LDI r3, 200
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
