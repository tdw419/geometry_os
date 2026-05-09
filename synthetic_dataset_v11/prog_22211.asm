; DESCRIPTION: Draws a blue line from (207, 50) to (100, 140).
; PLAN: r0=207(x1), r1=50(y1), r2=100(x2), r3=140(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 50
LDI r2, 100
LDI r3, 140
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
