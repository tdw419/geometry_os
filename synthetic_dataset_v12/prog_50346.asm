; DESCRIPTION: Renders a white line between points (385, 105) and (169, 179).
; PLAN: r0=385(x1), r1=105(y1), r2=169(x2), r3=179(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 105
LDI r2, 169
LDI r3, 179
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
