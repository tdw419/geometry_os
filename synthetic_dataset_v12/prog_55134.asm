; DESCRIPTION: Renders a blue line between points (484, 64) and (152, 255).
; PLAN: r0=484(x1), r1=64(y1), r2=152(x2), r3=255(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 64
LDI r2, 152
LDI r3, 255
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
