; DESCRIPTION: Places a white line segment connecting (104, 118) to (314, 171).
; PLAN: r0=104(x1), r1=118(y1), r2=314(x2), r3=171(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 118
LDI r2, 314
LDI r3, 171
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
