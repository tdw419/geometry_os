; DESCRIPTION: Renders a red line between points (222, 203) and (53, 72).
; PLAN: r0=222(x1), r1=203(y1), r2=53(x2), r3=72(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 203
LDI r2, 53
LDI r3, 72
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
