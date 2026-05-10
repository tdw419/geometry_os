; DESCRIPTION: Renders a white line segment connecting (54, 185) to (177, 119).
; PLAN: r0=54(x1), r1=185(y1), r2=177(x2), r3=119(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 185
LDI r2, 177
LDI r3, 119
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
