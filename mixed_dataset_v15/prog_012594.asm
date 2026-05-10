; DESCRIPTION: Places a red line segment connecting (266, 151) to (381, 115).
; PLAN: r0=266(x1), r1=151(y1), r2=381(x2), r3=115(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 151
LDI r2, 381
LDI r3, 115
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
