; DESCRIPTION: Places a yellow line segment connecting (360, 194) to (368, 100).
; PLAN: r0=360(x1), r1=194(y1), r2=368(x2), r3=100(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 194
LDI r2, 368
LDI r3, 100
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
