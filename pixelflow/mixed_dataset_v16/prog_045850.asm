; DESCRIPTION: Renders a purple line between points (52, 1) and (367, 10).
; PLAN: r0=52(x1), r1=1(y1), r2=367(x2), r3=10(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 1
LDI r2, 367
LDI r3, 10
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
