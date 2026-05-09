; DESCRIPTION: Renders a purple line between points (152, 115) and (207, 118).
; PLAN: r0=152(x1), r1=115(y1), r2=207(x2), r3=118(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 115
LDI r2, 207
LDI r3, 118
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
