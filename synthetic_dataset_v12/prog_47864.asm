; DESCRIPTION: Places a black line segment connecting (226, 53) to (413, 98).
; PLAN: r0=226(x1), r1=53(y1), r2=413(x2), r3=98(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 53
LDI r2, 413
LDI r3, 98
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
