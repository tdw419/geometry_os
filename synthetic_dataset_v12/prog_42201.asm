; DESCRIPTION: Places a black line segment connecting (505, 174) to (77, 177).
; PLAN: r0=505(x1), r1=174(y1), r2=77(x2), r3=177(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 174
LDI r2, 77
LDI r3, 177
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
