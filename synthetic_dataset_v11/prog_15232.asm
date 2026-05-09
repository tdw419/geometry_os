; DESCRIPTION: Places a green line segment connecting (199, 136) to (191, 52).
; PLAN: r0=199(x1), r1=136(y1), r2=191(x2), r3=52(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 136
LDI r2, 191
LDI r3, 52
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
