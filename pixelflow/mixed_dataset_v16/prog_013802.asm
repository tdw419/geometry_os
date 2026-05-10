; DESCRIPTION: Places a red line segment connecting (141, 31) to (462, 63).
; PLAN: r0=141(x1), r1=31(y1), r2=462(x2), r3=63(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 31
LDI r2, 462
LDI r3, 63
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
