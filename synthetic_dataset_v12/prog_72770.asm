; DESCRIPTION: Places a white line segment connecting (398, 19) to (336, 34).
; PLAN: r0=398(x1), r1=19(y1), r2=336(x2), r3=34(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 19
LDI r2, 336
LDI r3, 34
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
