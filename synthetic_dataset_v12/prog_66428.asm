; DESCRIPTION: Places a cyan line segment connecting (128, 217) to (77, 77).
; PLAN: r0=128(x1), r1=217(y1), r2=77(x2), r3=77(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 217
LDI r2, 77
LDI r3, 77
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
