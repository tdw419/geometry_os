; DESCRIPTION: Places a green line segment connecting (241, 207) to (101, 73).
; PLAN: r0=241(x1), r1=207(y1), r2=101(x2), r3=73(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 207
LDI r2, 101
LDI r3, 73
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
