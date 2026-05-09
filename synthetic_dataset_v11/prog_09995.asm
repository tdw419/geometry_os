; DESCRIPTION: Renders a yellow line between points (15, 122) and (102, 101).
; PLAN: r0=15(x1), r1=122(y1), r2=102(x2), r3=101(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 122
LDI r2, 102
LDI r3, 101
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
