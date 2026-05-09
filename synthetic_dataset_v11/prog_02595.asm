; DESCRIPTION: Renders a magenta line between points (91, 240) and (153, 123).
; PLAN: r0=91(x1), r1=240(y1), r2=153(x2), r3=123(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 240
LDI r2, 153
LDI r3, 123
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
