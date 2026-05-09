; DESCRIPTION: Renders a blue line between points (152, 133) and (135, 119).
; PLAN: r0=152(x1), r1=133(y1), r2=135(x2), r3=119(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 133
LDI r2, 135
LDI r3, 119
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
