; DESCRIPTION: Places a red line segment connecting (22, 29) to (52, 114).
; PLAN: r0=22(x1), r1=29(y1), r2=52(x2), r3=114(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 29
LDI r2, 52
LDI r3, 114
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
