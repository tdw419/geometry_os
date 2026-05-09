; DESCRIPTION: Renders a blue line between points (138, 243) and (110, 218).
; PLAN: r0=138(x1), r1=243(y1), r2=110(x2), r3=218(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 243
LDI r2, 110
LDI r3, 218
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
