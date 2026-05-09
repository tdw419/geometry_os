; DESCRIPTION: Draws a orange line from (66, 8) to (414, 67).
; PLAN: r0=66(x1), r1=8(y1), r2=414(x2), r3=67(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 8
LDI r2, 414
LDI r3, 67
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
