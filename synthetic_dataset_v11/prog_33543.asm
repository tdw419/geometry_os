; DESCRIPTION: Renders a yellow line between points (74, 56) and (119, 114).
; PLAN: r0=74(x1), r1=56(y1), r2=119(x2), r3=114(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 56
LDI r2, 119
LDI r3, 114
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
