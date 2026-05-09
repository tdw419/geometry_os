; DESCRIPTION: Renders a yellow line between points (170, 114) and (199, 97).
; PLAN: r0=170(x1), r1=114(y1), r2=199(x2), r3=97(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 114
LDI r2, 199
LDI r3, 97
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
