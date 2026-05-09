; DESCRIPTION: Places a white line segment connecting (218, 13) to (71, 5).
; PLAN: r0=218(x1), r1=13(y1), r2=71(x2), r3=5(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 13
LDI r2, 71
LDI r3, 5
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
