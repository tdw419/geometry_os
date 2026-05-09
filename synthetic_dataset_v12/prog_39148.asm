; DESCRIPTION: Draws a blue line from (475, 218) to (191, 11).
; PLAN: r0=475(x1), r1=218(y1), r2=191(x2), r3=11(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 218
LDI r2, 191
LDI r3, 11
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
