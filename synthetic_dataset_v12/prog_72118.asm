; DESCRIPTION: Places a white line segment connecting (221, 191) to (339, 64).
; PLAN: r0=221(x1), r1=191(y1), r2=339(x2), r3=64(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 191
LDI r2, 339
LDI r3, 64
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
