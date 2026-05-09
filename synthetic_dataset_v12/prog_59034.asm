; DESCRIPTION: Renders a purple line between points (258, 195) and (43, 51).
; PLAN: r0=258(x1), r1=195(y1), r2=43(x2), r3=51(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 195
LDI r2, 43
LDI r3, 51
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
