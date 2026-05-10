; DESCRIPTION: Places a white line segment connecting (227, 194) to (408, 82).
; PLAN: r0=227(x1), r1=194(y1), r2=408(x2), r3=82(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 194
LDI r2, 408
LDI r3, 82
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
