; DESCRIPTION: Places a red line segment connecting (174, 63) to (199, 238).
; PLAN: r0=174(x1), r1=63(y1), r2=199(x2), r3=238(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 63
LDI r2, 199
LDI r3, 238
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
