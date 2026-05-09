; DESCRIPTION: Places a white line segment connecting (368, 225) to (118, 187).
; PLAN: r0=368(x1), r1=225(y1), r2=118(x2), r3=187(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 225
LDI r2, 118
LDI r3, 187
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
