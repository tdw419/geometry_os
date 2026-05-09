; DESCRIPTION: Renders a blue line between points (29, 161) and (29, 109).
; PLAN: r0=29(x1), r1=161(y1), r2=29(x2), r3=109(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 161
LDI r2, 29
LDI r3, 109
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
