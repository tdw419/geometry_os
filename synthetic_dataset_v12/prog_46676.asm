; DESCRIPTION: Renders a white line between points (169, 34) and (22, 244).
; PLAN: r0=169(x1), r1=34(y1), r2=22(x2), r3=244(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 34
LDI r2, 22
LDI r3, 244
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
