; DESCRIPTION: Places a white line segment connecting (308, 227) to (117, 207).
; PLAN: r0=308(x1), r1=227(y1), r2=117(x2), r3=207(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 227
LDI r2, 117
LDI r3, 207
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
