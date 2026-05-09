; DESCRIPTION: Places a green line segment connecting (97, 103) to (131, 74).
; PLAN: r0=97(x1), r1=103(y1), r2=131(x2), r3=74(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 103
LDI r2, 131
LDI r3, 74
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
