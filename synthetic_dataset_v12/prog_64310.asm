; DESCRIPTION: Places a white line segment connecting (186, 232) to (11, 170).
; PLAN: r0=186(x1), r1=232(y1), r2=11(x2), r3=170(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 232
LDI r2, 11
LDI r3, 170
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
