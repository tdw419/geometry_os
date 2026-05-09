; DESCRIPTION: Places a red line segment connecting (6, 114) to (325, 138).
; PLAN: r0=6(x1), r1=114(y1), r2=325(x2), r3=138(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 114
LDI r2, 325
LDI r3, 138
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
