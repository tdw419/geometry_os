; DESCRIPTION: Places a red line segment connecting (484, 244) to (413, 151).
; PLAN: r0=484(x1), r1=244(y1), r2=413(x2), r3=151(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 244
LDI r2, 413
LDI r3, 151
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
