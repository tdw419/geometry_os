; DESCRIPTION: Places a cyan line segment connecting (412, 75) to (83, 87).
; PLAN: r0=412(x1), r1=75(y1), r2=83(x2), r3=87(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 75
LDI r2, 83
LDI r3, 87
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
