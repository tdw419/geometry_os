; DESCRIPTION: Places a white line segment connecting (311, 117) to (233, 26).
; PLAN: r0=311(x1), r1=117(y1), r2=233(x2), r3=26(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 117
LDI r2, 233
LDI r3, 26
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
