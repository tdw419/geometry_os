; DESCRIPTION: Places a red line segment connecting (16, 227) to (470, 189).
; PLAN: r0=16(x1), r1=227(y1), r2=470(x2), r3=189(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 227
LDI r2, 470
LDI r3, 189
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
