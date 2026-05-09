; DESCRIPTION: Renders a blue line between points (226, 23) and (447, 70).
; PLAN: r0=226(x1), r1=23(y1), r2=447(x2), r3=70(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 23
LDI r2, 447
LDI r3, 70
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
