; DESCRIPTION: Renders a green line between points (34, 21) and (169, 183).
; PLAN: r0=34(x1), r1=21(y1), r2=169(x2), r3=183(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 21
LDI r2, 169
LDI r3, 183
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
