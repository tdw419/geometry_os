; DESCRIPTION: Places a green line segment connecting (85, 95) to (62, 64).
; PLAN: r0=85(x1), r1=95(y1), r2=62(x2), r3=64(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 95
LDI r2, 62
LDI r3, 64
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
