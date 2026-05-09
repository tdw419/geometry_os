; DESCRIPTION: Renders a yellow line between points (471, 67) and (40, 217).
; PLAN: r0=471(x1), r1=67(y1), r2=40(x2), r3=217(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 67
LDI r2, 40
LDI r3, 217
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
