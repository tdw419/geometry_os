; DESCRIPTION: Places a green line segment connecting (199, 131) to (100, 143).
; PLAN: r0=199(x1), r1=131(y1), r2=100(x2), r3=143(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 131
LDI r2, 100
LDI r3, 143
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
