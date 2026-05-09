; DESCRIPTION: Renders a yellow line between points (170, 15) and (399, 116).
; PLAN: r0=170(x1), r1=15(y1), r2=399(x2), r3=116(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 15
LDI r2, 399
LDI r3, 116
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
