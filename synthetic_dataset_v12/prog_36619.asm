; DESCRIPTION: Renders a white line between points (169, 70) and (12, 58).
; PLAN: r0=169(x1), r1=70(y1), r2=12(x2), r3=58(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 70
LDI r2, 12
LDI r3, 58
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
