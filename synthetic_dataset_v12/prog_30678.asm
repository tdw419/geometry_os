; DESCRIPTION: Places a yellow line segment connecting (0, 103) to (377, 30).
; PLAN: r0=0(x1), r1=103(y1), r2=377(x2), r3=30(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 103
LDI r2, 377
LDI r3, 30
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
