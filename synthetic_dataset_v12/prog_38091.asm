; DESCRIPTION: Draws a orange line from (287, 36) to (297, 53).
; PLAN: r0=287(x1), r1=36(y1), r2=297(x2), r3=53(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 36
LDI r2, 297
LDI r3, 53
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
