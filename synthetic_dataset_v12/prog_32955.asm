; DESCRIPTION: Places a green line segment connecting (331, 247) to (486, 92).
; PLAN: r0=331(x1), r1=247(y1), r2=486(x2), r3=92(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 247
LDI r2, 486
LDI r3, 92
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
