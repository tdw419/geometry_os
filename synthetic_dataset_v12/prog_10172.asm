; DESCRIPTION: Places a white line segment connecting (218, 142) to (343, 103).
; PLAN: r0=218(x1), r1=142(y1), r2=343(x2), r3=103(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 142
LDI r2, 343
LDI r3, 103
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
