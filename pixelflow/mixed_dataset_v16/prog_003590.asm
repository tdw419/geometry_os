; DESCRIPTION: Renders a green line between points (490, 106) and (51, 244).
; PLAN: r0=490(x1), r1=106(y1), r2=51(x2), r3=244(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 106
LDI r2, 51
LDI r3, 244
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
