; DESCRIPTION: Places a cyan line segment connecting (468, 60) to (77, 31).
; PLAN: r0=468(x1), r1=60(y1), r2=77(x2), r3=31(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 60
LDI r2, 77
LDI r3, 31
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
