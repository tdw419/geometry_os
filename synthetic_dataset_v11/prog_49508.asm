; DESCRIPTION: Places a yellow line segment connecting (102, 64) to (26, 16).
; PLAN: r0=102(x1), r1=64(y1), r2=26(x2), r3=16(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 64
LDI r2, 26
LDI r3, 16
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
