; DESCRIPTION: Places a black line segment connecting (31, 77) to (38, 117).
; PLAN: r0=31(x1), r1=77(y1), r2=38(x2), r3=117(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 77
LDI r2, 38
LDI r3, 117
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
