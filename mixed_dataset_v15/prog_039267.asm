; DESCRIPTION: Renders a white line segment connecting (316, 106) to (110, 177).
; PLAN: r0=316(x1), r1=106(y1), r2=110(x2), r3=177(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 106
LDI r2, 110
LDI r3, 177
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
