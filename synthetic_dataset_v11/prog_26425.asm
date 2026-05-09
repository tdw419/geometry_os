; DESCRIPTION: Places a green line segment connecting (139, 39) to (51, 233).
; PLAN: r0=139(x1), r1=39(y1), r2=51(x2), r3=233(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 39
LDI r2, 51
LDI r3, 233
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
