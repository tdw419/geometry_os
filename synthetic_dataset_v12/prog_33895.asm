; DESCRIPTION: Draws a orange line from (253, 80) to (117, 25).
; PLAN: r0=253(x1), r1=80(y1), r2=117(x2), r3=25(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 80
LDI r2, 117
LDI r3, 25
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
