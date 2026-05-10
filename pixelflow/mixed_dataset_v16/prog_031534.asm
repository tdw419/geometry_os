; DESCRIPTION: Renders a white line segment connecting (337, 80) to (153, 85).
; PLAN: r0=337(x1), r1=80(y1), r2=153(x2), r3=85(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 80
LDI r2, 153
LDI r3, 85
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
