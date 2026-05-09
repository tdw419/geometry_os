; DESCRIPTION: Renders a purple line between points (16, 217) and (6, 91).
; PLAN: r0=16(x1), r1=217(y1), r2=6(x2), r3=91(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 217
LDI r2, 6
LDI r3, 91
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
