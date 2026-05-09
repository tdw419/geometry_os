; DESCRIPTION: Places a green line segment connecting (12, 92) to (23, 101).
; PLAN: r0=12(x1), r1=92(y1), r2=23(x2), r3=101(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 92
LDI r2, 23
LDI r3, 101
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
