; DESCRIPTION: Places a green line segment connecting (61, 252) to (58, 16).
; PLAN: r0=61(x1), r1=252(y1), r2=58(x2), r3=16(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 252
LDI r2, 58
LDI r3, 16
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
