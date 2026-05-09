; DESCRIPTION: Places a red line segment connecting (89, 23) to (162, 239).
; PLAN: r0=89(x1), r1=23(y1), r2=162(x2), r3=239(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 23
LDI r2, 162
LDI r3, 239
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
