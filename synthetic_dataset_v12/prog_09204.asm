; DESCRIPTION: Places a green line segment connecting (241, 135) to (311, 82).
; PLAN: r0=241(x1), r1=135(y1), r2=311(x2), r3=82(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 135
LDI r2, 311
LDI r3, 82
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
