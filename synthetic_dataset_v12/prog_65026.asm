; DESCRIPTION: Renders a purple line between points (175, 109) and (491, 6).
; PLAN: r0=175(x1), r1=109(y1), r2=491(x2), r3=6(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 109
LDI r2, 491
LDI r3, 6
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
