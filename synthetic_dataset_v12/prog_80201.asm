; DESCRIPTION: Places a green line segment connecting (102, 16) to (16, 36).
; PLAN: r0=102(x1), r1=16(y1), r2=16(x2), r3=36(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 16
LDI r2, 16
LDI r3, 36
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
