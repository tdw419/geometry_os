; DESCRIPTION: Draws a orange line from (246, 49) to (90, 45).
; PLAN: r0=246(x1), r1=49(y1), r2=90(x2), r3=45(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 49
LDI r2, 90
LDI r3, 45
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
