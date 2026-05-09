; DESCRIPTION: Places a white line segment connecting (7, 66) to (232, 214).
; PLAN: r0=7(x1), r1=66(y1), r2=232(x2), r3=214(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 66
LDI r2, 232
LDI r3, 214
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
