; DESCRIPTION: Draws a magenta line from (75, 227) to (317, 119).
; PLAN: r0=75(x1), r1=227(y1), r2=317(x2), r3=119(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 227
LDI r2, 317
LDI r3, 119
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
