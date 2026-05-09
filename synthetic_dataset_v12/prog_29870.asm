; DESCRIPTION: Renders a yellow line between points (505, 115) and (508, 67).
; PLAN: r0=505(x1), r1=115(y1), r2=508(x2), r3=67(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 115
LDI r2, 508
LDI r3, 67
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
