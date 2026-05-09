; DESCRIPTION: Places a yellow line segment connecting (462, 82) to (432, 151).
; PLAN: r0=462(x1), r1=82(y1), r2=432(x2), r3=151(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 82
LDI r2, 432
LDI r3, 151
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
