; DESCRIPTION: Renders a blue line between points (140, 108) and (118, 12).
; PLAN: r0=140(x1), r1=108(y1), r2=118(x2), r3=12(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 108
LDI r2, 118
LDI r3, 12
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
