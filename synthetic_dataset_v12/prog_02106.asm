; DESCRIPTION: Renders a purple line between points (174, 11) and (19, 96).
; PLAN: r0=174(x1), r1=11(y1), r2=19(x2), r3=96(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 11
LDI r2, 19
LDI r3, 96
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
