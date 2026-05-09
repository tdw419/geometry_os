; DESCRIPTION: Places a white line segment connecting (104, 238) to (457, 221).
; PLAN: r0=104(x1), r1=238(y1), r2=457(x2), r3=221(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 238
LDI r2, 457
LDI r3, 221
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
