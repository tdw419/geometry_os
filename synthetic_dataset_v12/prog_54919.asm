; DESCRIPTION: Renders a red line between points (109, 203) and (0, 90).
; PLAN: r0=109(x1), r1=203(y1), r2=0(x2), r3=90(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 203
LDI r2, 0
LDI r3, 90
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
