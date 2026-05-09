; DESCRIPTION: Renders a blue line between points (301, 121) and (162, 89).
; PLAN: r0=301(x1), r1=121(y1), r2=162(x2), r3=89(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 121
LDI r2, 162
LDI r3, 89
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
