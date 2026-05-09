; DESCRIPTION: Draws a blue line from (191, 95) to (110, 3).
; PLAN: r0=191(x1), r1=95(y1), r2=110(x2), r3=3(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 95
LDI r2, 110
LDI r3, 3
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
