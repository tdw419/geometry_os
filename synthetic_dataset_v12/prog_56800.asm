; DESCRIPTION: Places a cyan line segment connecting (83, 79) to (286, 217).
; PLAN: r0=83(x1), r1=79(y1), r2=286(x2), r3=217(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 79
LDI r2, 286
LDI r3, 217
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
