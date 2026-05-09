; DESCRIPTION: Places a white line segment connecting (52, 191) to (395, 249).
; PLAN: r0=52(x1), r1=191(y1), r2=395(x2), r3=249(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 191
LDI r2, 395
LDI r3, 249
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
