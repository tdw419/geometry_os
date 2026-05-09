; DESCRIPTION: Renders a blue line between points (149, 94) and (108, 161).
; PLAN: r0=149(x1), r1=94(y1), r2=108(x2), r3=161(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 94
LDI r2, 108
LDI r3, 161
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
