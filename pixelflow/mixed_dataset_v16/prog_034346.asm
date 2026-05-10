; DESCRIPTION: Draws a orange line from (209, 174) to (244, 15).
; PLAN: r0=209(x1), r1=174(y1), r2=244(x2), r3=15(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 174
LDI r2, 244
LDI r3, 15
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
