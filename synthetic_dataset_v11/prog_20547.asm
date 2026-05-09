; DESCRIPTION: Renders a purple line between points (63, 115) and (219, 66).
; PLAN: r0=63(x1), r1=115(y1), r2=219(x2), r3=66(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 115
LDI r2, 219
LDI r3, 66
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
