; DESCRIPTION: Renders a purple line between points (445, 1) and (432, 116).
; PLAN: r0=445(x1), r1=1(y1), r2=432(x2), r3=116(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 1
LDI r2, 432
LDI r3, 116
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
