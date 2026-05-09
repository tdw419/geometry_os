; DESCRIPTION: Places a white line segment connecting (308, 5) to (77, 69).
; PLAN: r0=308(x1), r1=5(y1), r2=77(x2), r3=69(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 5
LDI r2, 77
LDI r3, 69
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
