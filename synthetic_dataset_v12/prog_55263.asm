; DESCRIPTION: Places a white line segment connecting (142, 252) to (358, 190).
; PLAN: r0=142(x1), r1=252(y1), r2=358(x2), r3=190(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 252
LDI r2, 358
LDI r3, 190
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
