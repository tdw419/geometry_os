; DESCRIPTION: Places a red line segment connecting (185, 32) to (246, 66).
; PLAN: r0=185(x1), r1=32(y1), r2=246(x2), r3=66(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 32
LDI r2, 246
LDI r3, 66
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
