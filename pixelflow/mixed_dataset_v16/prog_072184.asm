; DESCRIPTION: Renders a red line between points (363, 88) and (54, 150).
; PLAN: r0=363(x1), r1=88(y1), r2=54(x2), r3=150(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 88
LDI r2, 54
LDI r3, 150
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
