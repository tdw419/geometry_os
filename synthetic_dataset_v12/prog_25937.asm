; DESCRIPTION: Renders a black line between points (155, 174) and (393, 60).
; PLAN: r0=155(x1), r1=174(y1), r2=393(x2), r3=60(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 174
LDI r2, 393
LDI r3, 60
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
