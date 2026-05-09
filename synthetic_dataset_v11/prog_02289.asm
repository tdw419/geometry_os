; DESCRIPTION: Draws a orange line from (67, 8) to (153, 204).
; PLAN: r0=67(x1), r1=8(y1), r2=153(x2), r3=204(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 8
LDI r2, 153
LDI r3, 204
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
