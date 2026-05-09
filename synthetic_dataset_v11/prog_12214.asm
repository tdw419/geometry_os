; DESCRIPTION: Renders a purple line between points (250, 138) and (35, 76).
; PLAN: r0=250(x1), r1=138(y1), r2=35(x2), r3=76(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 138
LDI r2, 35
LDI r3, 76
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
