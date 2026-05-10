; DESCRIPTION: Places a yellow line segment connecting (178, 136) to (383, 33).
; PLAN: r0=178(x1), r1=136(y1), r2=383(x2), r3=33(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 136
LDI r2, 383
LDI r3, 33
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
