; DESCRIPTION: Places a white line segment connecting (207, 58) to (44, 118).
; PLAN: r0=207(x1), r1=58(y1), r2=44(x2), r3=118(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 58
LDI r2, 44
LDI r3, 118
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
