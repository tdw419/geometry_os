; DESCRIPTION: Renders a blue line between points (108, 54) and (226, 233).
; PLAN: r0=108(x1), r1=54(y1), r2=226(x2), r3=233(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 54
LDI r2, 226
LDI r3, 233
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
