; DESCRIPTION: Draws a blue line from (191, 162) to (31, 5).
; PLAN: r0=191(x1), r1=162(y1), r2=31(x2), r3=5(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 162
LDI r2, 31
LDI r3, 5
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
