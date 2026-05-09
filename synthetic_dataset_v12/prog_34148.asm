; DESCRIPTION: Renders a blue line between points (482, 33) and (110, 116).
; PLAN: r0=482(x1), r1=33(y1), r2=110(x2), r3=116(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 33
LDI r2, 110
LDI r3, 116
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
