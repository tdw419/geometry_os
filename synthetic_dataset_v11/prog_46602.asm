; DESCRIPTION: Draws a orange line from (207, 182) to (210, 67).
; PLAN: r0=207(x1), r1=182(y1), r2=210(x2), r3=67(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 182
LDI r2, 210
LDI r3, 67
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
