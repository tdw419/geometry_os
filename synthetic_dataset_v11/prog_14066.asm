; DESCRIPTION: Renders a purple line between points (125, 63) and (15, 179).
; PLAN: r0=125(x1), r1=63(y1), r2=15(x2), r3=179(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 63
LDI r2, 15
LDI r3, 179
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
