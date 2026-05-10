; DESCRIPTION: Renders a red line between points (227, 252) and (367, 203).
; PLAN: r0=227(x1), r1=252(y1), r2=367(x2), r3=203(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 252
LDI r2, 367
LDI r3, 203
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
