; DESCRIPTION: Places a white line segment connecting (343, 0) to (209, 229).
; PLAN: r0=343(x1), r1=0(y1), r2=209(x2), r3=229(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 0
LDI r2, 209
LDI r3, 229
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
