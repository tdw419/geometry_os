; DESCRIPTION: Places a white line segment connecting (199, 164) to (467, 246).
; PLAN: r0=199(x1), r1=164(y1), r2=467(x2), r3=246(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 164
LDI r2, 467
LDI r3, 246
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
