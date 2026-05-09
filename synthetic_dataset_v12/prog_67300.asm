; DESCRIPTION: Places a cyan line segment connecting (251, 54) to (179, 31).
; PLAN: r0=251(x1), r1=54(y1), r2=179(x2), r3=31(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 54
LDI r2, 179
LDI r3, 31
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
