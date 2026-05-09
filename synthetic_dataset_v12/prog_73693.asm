; DESCRIPTION: Draws a white line from (287, 104) to (497, 188).
; PLAN: r0=287(x1), r1=104(y1), r2=497(x2), r3=188(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 104
LDI r2, 497
LDI r3, 188
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
