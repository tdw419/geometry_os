; DESCRIPTION: Places a white line segment connecting (289, 34) to (401, 207).
; PLAN: r0=289(x1), r1=34(y1), r2=401(x2), r3=207(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 34
LDI r2, 401
LDI r3, 207
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
