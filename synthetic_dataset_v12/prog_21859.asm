; DESCRIPTION: Renders a black line between points (302, 219) and (338, 169).
; PLAN: r0=302(x1), r1=219(y1), r2=338(x2), r3=169(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 219
LDI r2, 338
LDI r3, 169
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
