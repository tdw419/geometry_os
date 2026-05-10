; DESCRIPTION: Places a green line segment connecting (343, 87) to (80, 250).
; PLAN: r0=343(x1), r1=87(y1), r2=80(x2), r3=250(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 87
LDI r2, 80
LDI r3, 250
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
