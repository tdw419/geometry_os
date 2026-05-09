; DESCRIPTION: Places a magenta line segment connecting (141, 34) to (193, 82).
; PLAN: r0=141(x1), r1=34(y1), r2=193(x2), r3=82(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 34
LDI r2, 193
LDI r3, 82
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
