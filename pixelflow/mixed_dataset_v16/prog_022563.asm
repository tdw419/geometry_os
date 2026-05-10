; DESCRIPTION: Places a cyan line segment connecting (0, 236) to (459, 78).
; PLAN: r0=0(x1), r1=236(y1), r2=459(x2), r3=78(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 236
LDI r2, 459
LDI r3, 78
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
