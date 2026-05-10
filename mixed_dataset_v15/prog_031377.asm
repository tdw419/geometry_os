; DESCRIPTION: Places a red line segment connecting (66, 3) to (325, 151).
; PLAN: r0=66(x1), r1=3(y1), r2=325(x2), r3=151(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 3
LDI r2, 325
LDI r3, 151
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
