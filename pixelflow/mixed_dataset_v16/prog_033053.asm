; DESCRIPTION: Places a magenta line segment connecting (55, 82) to (189, 35).
; PLAN: r0=55(x1), r1=82(y1), r2=189(x2), r3=35(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 82
LDI r2, 189
LDI r3, 35
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
