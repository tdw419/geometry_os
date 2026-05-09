; DESCRIPTION: Renders a blue line between points (462, 233) and (106, 59).
; PLAN: r0=462(x1), r1=233(y1), r2=106(x2), r3=59(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 233
LDI r2, 106
LDI r3, 59
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
