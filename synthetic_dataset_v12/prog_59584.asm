; DESCRIPTION: Places a red line segment connecting (199, 174) to (355, 224).
; PLAN: r0=199(x1), r1=174(y1), r2=355(x2), r3=224(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 174
LDI r2, 355
LDI r3, 224
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
