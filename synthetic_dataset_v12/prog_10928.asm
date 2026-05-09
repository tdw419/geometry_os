; DESCRIPTION: Renders a blue line between points (507, 220) and (395, 255).
; PLAN: r0=507(x1), r1=220(y1), r2=395(x2), r3=255(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 220
LDI r2, 395
LDI r3, 255
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
