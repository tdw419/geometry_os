; DESCRIPTION: Places a white line segment connecting (496, 3) to (411, 204).
; PLAN: r0=496(x1), r1=3(y1), r2=411(x2), r3=204(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 3
LDI r2, 411
LDI r3, 204
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
