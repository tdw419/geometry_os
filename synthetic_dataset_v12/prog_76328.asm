; DESCRIPTION: Draws a orange line from (297, 141) to (391, 69).
; PLAN: r0=297(x1), r1=141(y1), r2=391(x2), r3=69(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 141
LDI r2, 391
LDI r3, 69
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
