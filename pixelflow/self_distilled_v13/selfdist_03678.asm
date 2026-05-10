; DESCRIPTION: Draws a blue line from (159, 124) to (226, 46).
; PLAN: r0=159(x1), r1=124(y1), r2=226(x2), r3=46(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 124
LDI r2, 226
LDI r3, 46
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
