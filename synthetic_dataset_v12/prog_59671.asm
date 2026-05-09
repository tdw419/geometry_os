; DESCRIPTION: Renders a blue line between points (395, 118) and (188, 236).
; PLAN: r0=395(x1), r1=118(y1), r2=188(x2), r3=236(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 118
LDI r2, 188
LDI r3, 236
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
