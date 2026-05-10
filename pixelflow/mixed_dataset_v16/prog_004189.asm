; DESCRIPTION: Places a black line segment connecting (116, 47) to (160, 158).
; PLAN: r0=116(x1), r1=47(y1), r2=160(x2), r3=158(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 47
LDI r2, 160
LDI r3, 158
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
