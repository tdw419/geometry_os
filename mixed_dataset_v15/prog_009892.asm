; DESCRIPTION: Places a yellow line segment connecting (417, 5) to (15, 53).
; PLAN: r0=417(x1), r1=5(y1), r2=15(x2), r3=53(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 5
LDI r2, 15
LDI r3, 53
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
