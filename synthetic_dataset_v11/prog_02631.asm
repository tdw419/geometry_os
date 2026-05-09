; DESCRIPTION: Renders a blue line between points (120, 216) and (104, 54).
; PLAN: r0=120(x1), r1=216(y1), r2=104(x2), r3=54(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 216
LDI r2, 104
LDI r3, 54
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
