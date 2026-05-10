; DESCRIPTION: Places a red line segment connecting (42, 119) to (347, 112).
; PLAN: r0=42(x1), r1=119(y1), r2=347(x2), r3=112(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 119
LDI r2, 347
LDI r3, 112
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
