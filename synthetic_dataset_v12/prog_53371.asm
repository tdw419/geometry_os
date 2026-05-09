; DESCRIPTION: Renders a blue line between points (135, 98) and (204, 79).
; PLAN: r0=135(x1), r1=98(y1), r2=204(x2), r3=79(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 98
LDI r2, 204
LDI r3, 79
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
