; DESCRIPTION: Renders a yellow line segment connecting (251, 174) to (116, 158).
; PLAN: r0=251(x1), r1=174(y1), r2=116(x2), r3=158(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 174
LDI r2, 116
LDI r3, 158
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
