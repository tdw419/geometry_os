; DESCRIPTION: Renders a purple line between points (169, 240) and (267, 66).
; PLAN: r0=169(x1), r1=240(y1), r2=267(x2), r3=66(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 240
LDI r2, 267
LDI r3, 66
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
