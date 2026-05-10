; DESCRIPTION: Places a green line segment connecting (9, 185) to (104, 199).
; PLAN: r0=9(x1), r1=185(y1), r2=104(x2), r3=199(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 185
LDI r2, 104
LDI r3, 199
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
