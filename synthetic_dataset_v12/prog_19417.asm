; DESCRIPTION: Draws a blue line from (225, 99) to (500, 179).
; PLAN: r0=225(x1), r1=99(y1), r2=500(x2), r3=179(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 99
LDI r2, 500
LDI r3, 179
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
