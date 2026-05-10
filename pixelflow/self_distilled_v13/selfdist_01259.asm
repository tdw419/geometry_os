; DESCRIPTION: Renders a yellow line segment connecting (78, 60) to (133, 146).
; PLAN: r0=78(x1), r1=60(y1), r2=133(x2), r3=146(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 60
LDI r2, 133
LDI r3, 146
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
