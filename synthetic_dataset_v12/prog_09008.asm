; DESCRIPTION: Places a black line segment connecting (212, 172) to (299, 104).
; PLAN: r0=212(x1), r1=172(y1), r2=299(x2), r3=104(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 172
LDI r2, 299
LDI r3, 104
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
