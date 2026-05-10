; DESCRIPTION: Renders a purple line between points (83, 196) and (505, 8).
; PLAN: r0=83(x1), r1=196(y1), r2=505(x2), r3=8(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 196
LDI r2, 505
LDI r3, 8
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
