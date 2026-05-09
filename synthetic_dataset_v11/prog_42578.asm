; DESCRIPTION: Places a red line segment connecting (115, 222) to (199, 26).
; PLAN: r0=115(x1), r1=222(y1), r2=199(x2), r3=26(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 222
LDI r2, 199
LDI r3, 26
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
