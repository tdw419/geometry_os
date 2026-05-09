; DESCRIPTION: Places a black line segment connecting (382, 212) to (117, 104).
; PLAN: r0=382(x1), r1=212(y1), r2=117(x2), r3=104(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 212
LDI r2, 117
LDI r3, 104
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
