; DESCRIPTION: Places a purple line segment connecting (88, 205) to (199, 138).
; PLAN: r0=88(x1), r1=205(y1), r2=199(x2), r3=138(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 205
LDI r2, 199
LDI r3, 138
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
