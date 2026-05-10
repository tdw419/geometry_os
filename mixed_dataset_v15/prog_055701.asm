; DESCRIPTION: Places a red line segment connecting (323, 88) to (173, 227).
; PLAN: r0=323(x1), r1=88(y1), r2=173(x2), r3=227(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 88
LDI r2, 173
LDI r3, 227
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
