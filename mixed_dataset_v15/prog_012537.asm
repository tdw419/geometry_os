; DESCRIPTION: Renders a black line between points (59, 155) and (164, 85).
; PLAN: r0=59(x1), r1=155(y1), r2=164(x2), r3=85(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 155
LDI r2, 164
LDI r3, 85
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
