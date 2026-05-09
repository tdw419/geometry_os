; DESCRIPTION: Renders a yellow line between points (158, 203) and (160, 178).
; PLAN: r0=158(x1), r1=203(y1), r2=160(x2), r3=178(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 203
LDI r2, 160
LDI r3, 178
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
