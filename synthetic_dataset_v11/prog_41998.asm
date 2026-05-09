; DESCRIPTION: Renders a blue line between points (38, 216) and (205, 0).
; PLAN: r0=38(x1), r1=216(y1), r2=205(x2), r3=0(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 216
LDI r2, 205
LDI r3, 0
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
