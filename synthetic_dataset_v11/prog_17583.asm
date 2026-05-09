; DESCRIPTION: Renders a yellow line between points (167, 203) and (11, 106).
; PLAN: r0=167(x1), r1=203(y1), r2=11(x2), r3=106(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 203
LDI r2, 11
LDI r3, 106
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
