; DESCRIPTION: Draws a blue line from (162, 200) to (186, 148).
; PLAN: r0=162(x1), r1=200(y1), r2=186(x2), r3=148(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 200
LDI r2, 186
LDI r3, 148
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
