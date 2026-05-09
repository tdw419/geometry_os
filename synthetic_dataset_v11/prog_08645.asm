; DESCRIPTION: Places a black line segment connecting (77, 171) to (116, 100).
; PLAN: r0=77(x1), r1=171(y1), r2=116(x2), r3=100(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 171
LDI r2, 116
LDI r3, 100
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
