; DESCRIPTION: Renders a red line between points (0, 101) and (329, 122).
; PLAN: r0=0(x1), r1=101(y1), r2=329(x2), r3=122(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 101
LDI r2, 329
LDI r3, 122
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
