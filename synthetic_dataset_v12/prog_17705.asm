; DESCRIPTION: Places a green line segment connecting (131, 103) to (252, 21).
; PLAN: r0=131(x1), r1=103(y1), r2=252(x2), r3=21(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 103
LDI r2, 252
LDI r3, 21
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
