; DESCRIPTION: Renders a yellow line segment connecting (106, 54) to (313, 167).
; PLAN: r0=106(x1), r1=54(y1), r2=313(x2), r3=167(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 54
LDI r2, 313
LDI r3, 167
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
