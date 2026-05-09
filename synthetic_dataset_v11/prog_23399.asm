; DESCRIPTION: Draws a green line from (66, 80) to (100, 145).
; PLAN: r0=66(x1), r1=80(y1), r2=100(x2), r3=145(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 80
LDI r2, 100
LDI r3, 145
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
