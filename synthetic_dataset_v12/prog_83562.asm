; DESCRIPTION: Places a cyan line segment connecting (311, 38) to (142, 80).
; PLAN: r0=311(x1), r1=38(y1), r2=142(x2), r3=80(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 38
LDI r2, 142
LDI r3, 80
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
