; DESCRIPTION: Draws a blue line from (322, 33) to (136, 229).
; PLAN: r0=322(x1), r1=33(y1), r2=136(x2), r3=229(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 33
LDI r2, 136
LDI r3, 229
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
