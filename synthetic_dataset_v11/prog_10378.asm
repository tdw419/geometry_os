; DESCRIPTION: Draws a blue line from (138, 163) to (44, 119).
; PLAN: r0=138(x1), r1=163(y1), r2=44(x2), r3=119(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 163
LDI r2, 44
LDI r3, 119
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
