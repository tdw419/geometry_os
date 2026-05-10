; DESCRIPTION: Renders a yellow line segment connecting (25, 161) to (311, 13).
; PLAN: r0=25(x1), r1=161(y1), r2=311(x2), r3=13(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 161
LDI r2, 311
LDI r3, 13
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
