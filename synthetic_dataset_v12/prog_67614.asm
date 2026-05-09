; DESCRIPTION: Places a green line segment connecting (471, 98) to (199, 176).
; PLAN: r0=471(x1), r1=98(y1), r2=199(x2), r3=176(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 98
LDI r2, 199
LDI r3, 176
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
