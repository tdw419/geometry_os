; DESCRIPTION: Renders a green line between points (476, 44) and (199, 49).
; PLAN: r0=476(x1), r1=44(y1), r2=199(x2), r3=49(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 44
LDI r2, 199
LDI r3, 49
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
