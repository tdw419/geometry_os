; DESCRIPTION: Places a green line segment connecting (452, 68) to (471, 55).
; PLAN: r0=452(x1), r1=68(y1), r2=471(x2), r3=55(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 68
LDI r2, 471
LDI r3, 55
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
