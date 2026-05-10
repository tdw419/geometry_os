; DESCRIPTION: Renders a red line segment connecting (77, 22) to (267, 81).
; PLAN: r0=77(x1), r1=22(y1), r2=267(x2), r3=81(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 22
LDI r2, 267
LDI r3, 81
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
