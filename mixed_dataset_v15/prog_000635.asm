; DESCRIPTION: Places a red line segment connecting (179, 7) to (8, 238).
; PLAN: r0=179(x1), r1=7(y1), r2=8(x2), r3=238(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 7
LDI r2, 8
LDI r3, 238
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
