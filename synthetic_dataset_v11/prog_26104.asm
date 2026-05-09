; DESCRIPTION: Renders a red line between points (250, 203) and (169, 128).
; PLAN: r0=250(x1), r1=203(y1), r2=169(x2), r3=128(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 203
LDI r2, 169
LDI r3, 128
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
