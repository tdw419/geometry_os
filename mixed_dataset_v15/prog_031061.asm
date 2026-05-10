; DESCRIPTION: Places a cyan line segment connecting (83, 34) to (89, 247).
; PLAN: r0=83(x1), r1=34(y1), r2=89(x2), r3=247(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 34
LDI r2, 89
LDI r3, 247
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
