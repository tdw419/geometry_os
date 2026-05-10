; DESCRIPTION: Places a white line segment connecting (311, 8) to (51, 7).
; PLAN: r0=311(x1), r1=8(y1), r2=51(x2), r3=7(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 8
LDI r2, 51
LDI r3, 7
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
