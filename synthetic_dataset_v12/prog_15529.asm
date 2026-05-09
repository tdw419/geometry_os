; DESCRIPTION: Places a white line segment connecting (474, 92) to (170, 247).
; PLAN: r0=474(x1), r1=92(y1), r2=170(x2), r3=247(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 92
LDI r2, 170
LDI r3, 247
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
