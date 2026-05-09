; DESCRIPTION: Renders a yellow line between points (153, 21) and (47, 200).
; PLAN: r0=153(x1), r1=21(y1), r2=47(x2), r3=200(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 21
LDI r2, 47
LDI r3, 200
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
