; DESCRIPTION: Renders a yellow line between points (342, 21) and (428, 118).
; PLAN: r0=342(x1), r1=21(y1), r2=428(x2), r3=118(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 21
LDI r2, 428
LDI r3, 118
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
