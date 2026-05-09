; DESCRIPTION: Renders a red line between points (101, 203) and (175, 199).
; PLAN: r0=101(x1), r1=203(y1), r2=175(x2), r3=199(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 203
LDI r2, 175
LDI r3, 199
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
