; DESCRIPTION: Draws a blue line from (62, 225) to (129, 124).
; PLAN: r0=62(x1), r1=225(y1), r2=129(x2), r3=124(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 225
LDI r2, 129
LDI r3, 124
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
