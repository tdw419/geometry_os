; DESCRIPTION: Places a black line segment connecting (68, 226) to (199, 36).
; PLAN: r0=68(x1), r1=226(y1), r2=199(x2), r3=36(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 226
LDI r2, 199
LDI r3, 36
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
