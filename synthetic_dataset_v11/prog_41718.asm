; DESCRIPTION: Places a green line segment connecting (90, 52) to (199, 137).
; PLAN: r0=90(x1), r1=52(y1), r2=199(x2), r3=137(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 52
LDI r2, 199
LDI r3, 137
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
