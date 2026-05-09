; DESCRIPTION: Renders a yellow line between points (47, 216) and (28, 157).
; PLAN: r0=47(x1), r1=216(y1), r2=28(x2), r3=157(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 216
LDI r2, 28
LDI r3, 157
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
