; DESCRIPTION: Renders a purple line between points (30, 9) and (226, 220).
; PLAN: r0=30(x1), r1=9(y1), r2=226(x2), r3=220(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 9
LDI r2, 226
LDI r3, 220
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
