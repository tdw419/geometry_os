; DESCRIPTION: Places a cyan line segment connecting (251, 44) to (142, 245).
; PLAN: r0=251(x1), r1=44(y1), r2=142(x2), r3=245(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 44
LDI r2, 142
LDI r3, 245
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
