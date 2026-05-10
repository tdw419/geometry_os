; DESCRIPTION: Draws a blue line from (124, 54) to (372, 119).
; PLAN: r0=124(x1), r1=54(y1), r2=372(x2), r3=119(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 54
LDI r2, 372
LDI r3, 119
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
