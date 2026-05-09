; DESCRIPTION: Places a green line segment connecting (208, 61) to (58, 35).
; PLAN: r0=208(x1), r1=61(y1), r2=58(x2), r3=35(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 61
LDI r2, 58
LDI r3, 35
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
