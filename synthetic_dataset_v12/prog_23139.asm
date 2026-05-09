; DESCRIPTION: Places a red line segment connecting (166, 33) to (496, 100).
; PLAN: r0=166(x1), r1=33(y1), r2=496(x2), r3=100(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 33
LDI r2, 496
LDI r3, 100
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
