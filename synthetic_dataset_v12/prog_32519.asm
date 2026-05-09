; DESCRIPTION: Draws a orange line from (174, 114) to (253, 30).
; PLAN: r0=174(x1), r1=114(y1), r2=253(x2), r3=30(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 114
LDI r2, 253
LDI r3, 30
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
