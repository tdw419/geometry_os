; DESCRIPTION: Places a yellow line segment connecting (413, 25) to (484, 206).
; PLAN: r0=413(x1), r1=25(y1), r2=484(x2), r3=206(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 25
LDI r2, 484
LDI r3, 206
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
