; DESCRIPTION: Renders a red line between points (200, 70) and (325, 88).
; PLAN: r0=200(x1), r1=70(y1), r2=325(x2), r3=88(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 70
LDI r2, 325
LDI r3, 88
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
