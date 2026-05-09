; DESCRIPTION: Renders a purple line between points (113, 66) and (176, 58).
; PLAN: r0=113(x1), r1=66(y1), r2=176(x2), r3=58(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 66
LDI r2, 176
LDI r3, 58
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
