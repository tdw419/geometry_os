; DESCRIPTION: Renders a yellow line segment connecting (123, 95) to (166, 99).
; PLAN: r0=123(x1), r1=95(y1), r2=166(x2), r3=99(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 95
LDI r2, 166
LDI r3, 99
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
