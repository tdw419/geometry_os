; DESCRIPTION: Draws a blue line from (472, 162) to (79, 208).
; PLAN: r0=472(x1), r1=162(y1), r2=79(x2), r3=208(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 162
LDI r2, 79
LDI r3, 208
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
