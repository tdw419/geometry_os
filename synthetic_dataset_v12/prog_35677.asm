; DESCRIPTION: Renders a blue line between points (454, 118) and (252, 0).
; PLAN: r0=454(x1), r1=118(y1), r2=252(x2), r3=0(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 118
LDI r2, 252
LDI r3, 0
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
