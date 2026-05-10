; DESCRIPTION: Renders a white line segment connecting (22, 81) to (388, 91).
; PLAN: r0=22(x1), r1=81(y1), r2=388(x2), r3=91(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 81
LDI r2, 388
LDI r3, 91
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
