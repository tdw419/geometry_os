; DESCRIPTION: Places a yellow line segment connecting (213, 105) to (131, 60).
; PLAN: r0=213(x1), r1=105(y1), r2=131(x2), r3=60(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 105
LDI r2, 131
LDI r3, 60
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
