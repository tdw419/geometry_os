; DESCRIPTION: Renders a blue line between points (99, 229) and (220, 169).
; PLAN: r0=99(x1), r1=229(y1), r2=220(x2), r3=169(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 229
LDI r2, 220
LDI r3, 169
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
