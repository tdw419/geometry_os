; DESCRIPTION: Renders a blue line between points (198, 29) and (161, 12).
; PLAN: r0=198(x1), r1=29(y1), r2=161(x2), r3=12(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 29
LDI r2, 161
LDI r3, 12
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
