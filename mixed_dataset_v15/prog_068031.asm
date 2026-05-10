; DESCRIPTION: Renders a blue line between points (321, 43) and (355, 178).
; PLAN: r0=321(x1), r1=43(y1), r2=355(x2), r3=178(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 43
LDI r2, 355
LDI r3, 178
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
