; DESCRIPTION: Places a green line segment connecting (459, 51) to (37, 183).
; PLAN: r0=459(x1), r1=51(y1), r2=37(x2), r3=183(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 51
LDI r2, 37
LDI r3, 183
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
