; DESCRIPTION: Places a white line segment connecting (486, 153) to (249, 35).
; PLAN: r0=486(x1), r1=153(y1), r2=249(x2), r3=35(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 153
LDI r2, 249
LDI r3, 35
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
