; DESCRIPTION: Renders a purple line between points (27, 20) and (13, 194).
; PLAN: r0=27(x1), r1=20(y1), r2=13(x2), r3=194(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 20
LDI r2, 13
LDI r3, 194
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
