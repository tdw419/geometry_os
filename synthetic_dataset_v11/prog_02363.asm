; DESCRIPTION: Renders a red line between points (252, 66) and (133, 5).
; PLAN: r0=252(x1), r1=66(y1), r2=133(x2), r3=5(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 66
LDI r2, 133
LDI r3, 5
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
