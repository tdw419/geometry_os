; DESCRIPTION: Places a yellow line segment connecting (107, 105) to (238, 204).
; PLAN: r0=107(x1), r1=105(y1), r2=238(x2), r3=204(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 105
LDI r2, 238
LDI r3, 204
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
