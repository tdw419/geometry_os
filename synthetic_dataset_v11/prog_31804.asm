; DESCRIPTION: Draws a orange line from (16, 183) to (61, 67).
; PLAN: r0=16(x1), r1=183(y1), r2=61(x2), r3=67(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 183
LDI r2, 61
LDI r3, 67
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
