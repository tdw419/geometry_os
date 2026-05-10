; DESCRIPTION: Places a red line segment connecting (138, 55) to (496, 98).
; PLAN: r0=138(x1), r1=55(y1), r2=496(x2), r3=98(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 55
LDI r2, 496
LDI r3, 98
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
