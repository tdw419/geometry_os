; DESCRIPTION: Renders a blue line between points (111, 250) and (153, 104).
; PLAN: r0=111(x1), r1=250(y1), r2=153(x2), r3=104(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 250
LDI r2, 153
LDI r3, 104
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
