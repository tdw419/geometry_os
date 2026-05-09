; DESCRIPTION: Renders a blue line between points (249, 176) and (158, 6).
; PLAN: r0=249(x1), r1=176(y1), r2=158(x2), r3=6(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 176
LDI r2, 158
LDI r3, 6
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
