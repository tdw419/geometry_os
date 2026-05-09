; DESCRIPTION: Places a white line segment connecting (8, 1) to (221, 247).
; PLAN: r0=8(x1), r1=1(y1), r2=221(x2), r3=247(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 1
LDI r2, 221
LDI r3, 247
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
