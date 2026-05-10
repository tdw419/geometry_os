; DESCRIPTION: Renders a yellow line segment connecting (306, 133) to (11, 191).
; PLAN: r0=306(x1), r1=133(y1), r2=11(x2), r3=191(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 133
LDI r2, 11
LDI r3, 191
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
