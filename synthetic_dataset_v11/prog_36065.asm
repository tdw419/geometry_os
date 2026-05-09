; DESCRIPTION: Renders a blue line between points (36, 149) and (192, 34).
; PLAN: r0=36(x1), r1=149(y1), r2=192(x2), r3=34(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 149
LDI r2, 192
LDI r3, 34
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
