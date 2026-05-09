; DESCRIPTION: Places a white line segment connecting (154, 191) to (161, 218).
; PLAN: r0=154(x1), r1=191(y1), r2=161(x2), r3=218(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 191
LDI r2, 161
LDI r3, 218
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
