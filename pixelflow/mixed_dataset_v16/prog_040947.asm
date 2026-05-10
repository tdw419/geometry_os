; DESCRIPTION: Places a red line segment connecting (309, 133) to (343, 13).
; PLAN: r0=309(x1), r1=133(y1), r2=343(x2), r3=13(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 133
LDI r2, 343
LDI r3, 13
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
