; DESCRIPTION: Renders a purple line between points (291, 10) and (233, 26).
; PLAN: r0=291(x1), r1=10(y1), r2=233(x2), r3=26(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 10
LDI r2, 233
LDI r3, 26
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
