; DESCRIPTION: Places a orange line segment connecting (199, 15) to (197, 202).
; PLAN: r0=199(x1), r1=15(y1), r2=197(x2), r3=202(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 15
LDI r2, 197
LDI r3, 202
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
