; DESCRIPTION: Renders a green line between points (54, 106) and (85, 88).
; PLAN: r0=54(x1), r1=106(y1), r2=85(x2), r3=88(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 106
LDI r2, 85
LDI r3, 88
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
