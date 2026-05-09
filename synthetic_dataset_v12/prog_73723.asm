; DESCRIPTION: Draws a orange line from (441, 69) to (58, 53).
; PLAN: r0=441(x1), r1=69(y1), r2=58(x2), r3=53(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 69
LDI r2, 58
LDI r3, 53
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
