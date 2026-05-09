; DESCRIPTION: Places a red line segment connecting (3, 198) to (148, 32).
; PLAN: r0=3(x1), r1=198(y1), r2=148(x2), r3=32(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 198
LDI r2, 148
LDI r3, 32
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
