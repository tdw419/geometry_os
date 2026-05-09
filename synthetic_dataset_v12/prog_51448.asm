; DESCRIPTION: Renders a purple line between points (71, 152) and (342, 156).
; PLAN: r0=71(x1), r1=152(y1), r2=342(x2), r3=156(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 152
LDI r2, 342
LDI r3, 156
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
