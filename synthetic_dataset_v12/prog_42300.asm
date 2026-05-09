; DESCRIPTION: Draws a orange line from (318, 103) to (215, 122).
; PLAN: r0=318(x1), r1=103(y1), r2=215(x2), r3=122(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 103
LDI r2, 215
LDI r3, 122
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
