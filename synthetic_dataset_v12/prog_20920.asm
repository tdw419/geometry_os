; DESCRIPTION: Renders a blue line between points (140, 152) and (244, 218).
; PLAN: r0=140(x1), r1=152(y1), r2=244(x2), r3=218(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 152
LDI r2, 244
LDI r3, 218
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
