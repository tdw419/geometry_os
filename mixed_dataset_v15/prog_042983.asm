; DESCRIPTION: Draws a green line from (118, 212) to (227, 100).
; PLAN: r0=118(x1), r1=212(y1), r2=227(x2), r3=100(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 212
LDI r2, 227
LDI r3, 100
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
