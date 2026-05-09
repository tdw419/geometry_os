; DESCRIPTION: Renders a blue line between points (191, 124) and (44, 105).
; PLAN: r0=191(x1), r1=124(y1), r2=44(x2), r3=105(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 124
LDI r2, 44
LDI r3, 105
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
