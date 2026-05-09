; DESCRIPTION: Renders a purple line between points (125, 5) and (302, 172).
; PLAN: r0=125(x1), r1=5(y1), r2=302(x2), r3=172(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 5
LDI r2, 302
LDI r3, 172
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
