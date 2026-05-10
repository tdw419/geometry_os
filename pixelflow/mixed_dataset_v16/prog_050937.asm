; DESCRIPTION: Renders a purple line between points (189, 115) and (319, 141).
; PLAN: r0=189(x1), r1=115(y1), r2=319(x2), r3=141(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 115
LDI r2, 319
LDI r3, 141
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
