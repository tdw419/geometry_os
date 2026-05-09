; DESCRIPTION: Renders a blue line between points (302, 4) and (9, 88).
; PLAN: r0=302(x1), r1=4(y1), r2=9(x2), r3=88(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 4
LDI r2, 9
LDI r3, 88
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
