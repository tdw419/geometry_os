; DESCRIPTION: Renders a yellow line between points (45, 35) and (106, 217).
; PLAN: r0=45(x1), r1=35(y1), r2=106(x2), r3=217(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 35
LDI r2, 106
LDI r3, 217
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
