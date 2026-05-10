; DESCRIPTION: Places a white line segment connecting (411, 252) to (104, 19).
; PLAN: r0=411(x1), r1=252(y1), r2=104(x2), r3=19(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 252
LDI r2, 104
LDI r3, 19
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
