; DESCRIPTION: Renders a purple line between points (430, 17) and (387, 11).
; PLAN: r0=430(x1), r1=17(y1), r2=387(x2), r3=11(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 17
LDI r2, 387
LDI r3, 11
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
