; DESCRIPTION: Places a black line segment connecting (11, 157) to (117, 183).
; PLAN: r0=11(x1), r1=157(y1), r2=117(x2), r3=183(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 157
LDI r2, 117
LDI r3, 183
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
