; DESCRIPTION: Renders a yellow line segment connecting (95, 39) to (221, 145).
; PLAN: r0=95(x1), r1=39(y1), r2=221(x2), r3=145(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 39
LDI r2, 221
LDI r3, 145
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
