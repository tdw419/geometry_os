; DESCRIPTION: Renders a red line between points (222, 88) and (105, 241).
; PLAN: r0=222(x1), r1=88(y1), r2=105(x2), r3=241(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 88
LDI r2, 105
LDI r3, 241
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
