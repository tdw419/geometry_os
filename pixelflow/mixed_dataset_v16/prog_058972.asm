; DESCRIPTION: Renders a blue line between points (46, 216) and (138, 24).
; PLAN: r0=46(x1), r1=216(y1), r2=138(x2), r3=24(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 216
LDI r2, 138
LDI r3, 24
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
