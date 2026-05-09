; DESCRIPTION: Places a white line segment connecting (370, 229) to (437, 194).
; PLAN: r0=370(x1), r1=229(y1), r2=437(x2), r3=194(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 229
LDI r2, 437
LDI r3, 194
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
