; DESCRIPTION: Renders a green line between points (139, 69) and (169, 22).
; PLAN: r0=139(x1), r1=69(y1), r2=169(x2), r3=22(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 69
LDI r2, 169
LDI r3, 22
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
