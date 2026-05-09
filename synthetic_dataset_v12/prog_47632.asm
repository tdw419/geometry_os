; DESCRIPTION: Draws a orange line from (352, 174) to (245, 26).
; PLAN: r0=352(x1), r1=174(y1), r2=245(x2), r3=26(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 174
LDI r2, 245
LDI r3, 26
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
