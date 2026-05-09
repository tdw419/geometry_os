; DESCRIPTION: Places a cyan line segment connecting (425, 80) to (72, 78).
; PLAN: r0=425(x1), r1=80(y1), r2=72(x2), r3=78(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 80
LDI r2, 72
LDI r3, 78
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
