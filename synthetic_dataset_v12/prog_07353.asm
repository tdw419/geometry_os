; DESCRIPTION: Draws a blue line from (314, 120) to (409, 162).
; PLAN: r0=314(x1), r1=120(y1), r2=409(x2), r3=162(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 120
LDI r2, 409
LDI r3, 162
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
