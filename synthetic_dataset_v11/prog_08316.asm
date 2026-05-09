; DESCRIPTION: Places a white line segment connecting (131, 103) to (124, 3).
; PLAN: r0=131(x1), r1=103(y1), r2=124(x2), r3=3(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 103
LDI r2, 124
LDI r3, 3
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
