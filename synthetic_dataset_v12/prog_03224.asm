; DESCRIPTION: Draws a orange line from (176, 35) to (282, 114).
; PLAN: r0=176(x1), r1=35(y1), r2=282(x2), r3=114(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 35
LDI r2, 282
LDI r3, 114
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
