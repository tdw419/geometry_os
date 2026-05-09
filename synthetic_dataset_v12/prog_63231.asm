; DESCRIPTION: Places a white line segment connecting (87, 95) to (457, 183).
; PLAN: r0=87(x1), r1=95(y1), r2=457(x2), r3=183(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 95
LDI r2, 457
LDI r3, 183
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
