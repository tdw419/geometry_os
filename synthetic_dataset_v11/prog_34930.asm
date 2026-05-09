; DESCRIPTION: Renders a blue line between points (195, 217) and (58, 233).
; PLAN: r0=195(x1), r1=217(y1), r2=58(x2), r3=233(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 217
LDI r2, 58
LDI r3, 233
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
