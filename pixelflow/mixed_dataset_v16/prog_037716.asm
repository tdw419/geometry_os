; DESCRIPTION: Places a green line segment connecting (276, 2) to (83, 14).
; PLAN: r0=276(x1), r1=2(y1), r2=83(x2), r3=14(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 2
LDI r2, 83
LDI r3, 14
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
