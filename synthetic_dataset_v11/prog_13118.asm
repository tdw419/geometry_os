; DESCRIPTION: Places a cyan line segment connecting (199, 78) to (145, 172).
; PLAN: r0=199(x1), r1=78(y1), r2=145(x2), r3=172(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 78
LDI r2, 145
LDI r3, 172
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
