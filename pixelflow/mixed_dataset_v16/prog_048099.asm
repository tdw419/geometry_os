; DESCRIPTION: Renders a yellow line segment connecting (158, 186) to (99, 19).
; PLAN: r0=158(x1), r1=186(y1), r2=99(x2), r3=19(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 186
LDI r2, 99
LDI r3, 19
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
