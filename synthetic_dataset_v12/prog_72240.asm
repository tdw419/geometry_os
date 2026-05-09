; DESCRIPTION: Renders a purple line between points (97, 202) and (152, 118).
; PLAN: r0=97(x1), r1=202(y1), r2=152(x2), r3=118(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 202
LDI r2, 152
LDI r3, 118
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
