; DESCRIPTION: Renders a purple line between points (51, 79) and (84, 192).
; PLAN: r0=51(x1), r1=79(y1), r2=84(x2), r3=192(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 79
LDI r2, 84
LDI r3, 192
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
