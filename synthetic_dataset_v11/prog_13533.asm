; DESCRIPTION: Renders a purple line between points (44, 252) and (180, 252).
; PLAN: r0=44(x1), r1=252(y1), r2=180(x2), r3=252(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 252
LDI r2, 180
LDI r3, 252
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
