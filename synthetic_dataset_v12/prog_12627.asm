; DESCRIPTION: Places a black line segment connecting (199, 148) to (265, 25).
; PLAN: r0=199(x1), r1=148(y1), r2=265(x2), r3=25(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 148
LDI r2, 265
LDI r3, 25
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
