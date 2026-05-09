; DESCRIPTION: Places a red line segment connecting (73, 53) to (253, 44).
; PLAN: r0=73(x1), r1=53(y1), r2=253(x2), r3=44(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 53
LDI r2, 253
LDI r3, 44
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
