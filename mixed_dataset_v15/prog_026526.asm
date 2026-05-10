; DESCRIPTION: Renders a blue line between points (287, 172) and (218, 55).
; PLAN: r0=287(x1), r1=172(y1), r2=218(x2), r3=55(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 172
LDI r2, 218
LDI r3, 55
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
