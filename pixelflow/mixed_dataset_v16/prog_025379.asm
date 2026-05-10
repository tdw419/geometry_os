; DESCRIPTION: Renders a purple line between points (106, 195) and (19, 13).
; PLAN: r0=106(x1), r1=195(y1), r2=19(x2), r3=13(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 195
LDI r2, 19
LDI r3, 13
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
