; DESCRIPTION: Renders a purple line between points (125, 121) and (169, 83).
; PLAN: r0=125(x1), r1=121(y1), r2=169(x2), r3=83(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 121
LDI r2, 169
LDI r3, 83
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
