; DESCRIPTION: Places a white line segment connecting (193, 191) to (255, 34).
; PLAN: r0=193(x1), r1=191(y1), r2=255(x2), r3=34(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 191
LDI r2, 255
LDI r3, 34
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
