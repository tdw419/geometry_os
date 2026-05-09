; DESCRIPTION: Places a red line segment connecting (361, 157) to (199, 91).
; PLAN: r0=361(x1), r1=157(y1), r2=199(x2), r3=91(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 157
LDI r2, 199
LDI r3, 91
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
