; DESCRIPTION: Places a white line segment connecting (296, 218) to (104, 25).
; PLAN: r0=296(x1), r1=218(y1), r2=104(x2), r3=25(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 218
LDI r2, 104
LDI r3, 25
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
