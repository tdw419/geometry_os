; DESCRIPTION: Places a green line segment connecting (74, 100) to (62, 236).
; PLAN: r0=74(x1), r1=100(y1), r2=62(x2), r3=236(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 100
LDI r2, 62
LDI r3, 236
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
