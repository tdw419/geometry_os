; DESCRIPTION: Places a red line segment connecting (496, 57) to (138, 123).
; PLAN: r0=496(x1), r1=57(y1), r2=138(x2), r3=123(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 57
LDI r2, 138
LDI r3, 123
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
