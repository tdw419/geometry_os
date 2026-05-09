; DESCRIPTION: Renders a purple line between points (220, 43) and (213, 58).
; PLAN: r0=220(x1), r1=43(y1), r2=213(x2), r3=58(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 43
LDI r2, 213
LDI r3, 58
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
