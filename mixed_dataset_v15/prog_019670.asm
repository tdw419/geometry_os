; DESCRIPTION: Renders a magenta line between points (302, 4) and (122, 18).
; PLAN: r0=302(x1), r1=4(y1), r2=122(x2), r3=18(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 4
LDI r2, 122
LDI r3, 18
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
