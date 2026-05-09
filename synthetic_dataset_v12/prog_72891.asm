; DESCRIPTION: Places a red line segment connecting (359, 14) to (148, 189).
; PLAN: r0=359(x1), r1=14(y1), r2=148(x2), r3=189(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 14
LDI r2, 148
LDI r3, 189
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
