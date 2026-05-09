; DESCRIPTION: Places a black line segment connecting (158, 177) to (158, 199).
; PLAN: r0=158(x1), r1=177(y1), r2=158(x2), r3=199(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 177
LDI r2, 158
LDI r3, 199
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
