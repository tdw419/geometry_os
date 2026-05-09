; DESCRIPTION: Renders a blue line between points (302, 13) and (472, 187).
; PLAN: r0=302(x1), r1=13(y1), r2=472(x2), r3=187(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 13
LDI r2, 472
LDI r3, 187
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
