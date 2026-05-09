; DESCRIPTION: Renders a purple line between points (313, 203) and (301, 110).
; PLAN: r0=313(x1), r1=203(y1), r2=301(x2), r3=110(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 203
LDI r2, 301
LDI r3, 110
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
