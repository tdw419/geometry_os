; DESCRIPTION: Renders a purple line between points (21, 91) and (22, 36).
; PLAN: r0=21(x1), r1=91(y1), r2=22(x2), r3=36(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 91
LDI r2, 22
LDI r3, 36
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
