; DESCRIPTION: Places a white line segment connecting (130, 131) to (462, 81).
; PLAN: r0=130(x1), r1=131(y1), r2=462(x2), r3=81(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 131
LDI r2, 462
LDI r3, 81
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
