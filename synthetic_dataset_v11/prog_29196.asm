; DESCRIPTION: Renders a purple line between points (114, 58) and (44, 71).
; PLAN: r0=114(x1), r1=58(y1), r2=44(x2), r3=71(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 58
LDI r2, 44
LDI r3, 71
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
