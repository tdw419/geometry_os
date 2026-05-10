; DESCRIPTION: Draws a orange line from (116, 65) to (204, 103).
; PLAN: r0=116(x1), r1=65(y1), r2=204(x2), r3=103(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 65
LDI r2, 204
LDI r3, 103
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
