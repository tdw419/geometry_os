; DESCRIPTION: Renders a red line between points (169, 107) and (71, 203).
; PLAN: r0=169(x1), r1=107(y1), r2=71(x2), r3=203(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 107
LDI r2, 71
LDI r3, 203
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
