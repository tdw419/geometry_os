; DESCRIPTION: Renders a green line segment connecting (116, 34) to (11, 136).
; PLAN: r0=116(x1), r1=34(y1), r2=11(x2), r3=136(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 34
LDI r2, 11
LDI r3, 136
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
