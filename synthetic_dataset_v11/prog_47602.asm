; DESCRIPTION: Renders a purple line between points (226, 35) and (177, 134).
; PLAN: r0=226(x1), r1=35(y1), r2=177(x2), r3=134(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 35
LDI r2, 177
LDI r3, 134
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
