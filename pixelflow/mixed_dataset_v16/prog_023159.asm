; DESCRIPTION: Places a red line segment connecting (241, 18) to (164, 179).
; PLAN: r0=241(x1), r1=18(y1), r2=164(x2), r3=179(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 18
LDI r2, 164
LDI r3, 179
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
