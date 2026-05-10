; DESCRIPTION: Draws a blue line from (75, 161) to (158, 150).
; PLAN: r0=75(x1), r1=161(y1), r2=158(x2), r3=150(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 161
LDI r2, 158
LDI r3, 150
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
