; DESCRIPTION: Draws a orange line from (407, 186) to (209, 41).
; PLAN: r0=407(x1), r1=186(y1), r2=209(x2), r3=41(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 186
LDI r2, 209
LDI r3, 41
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
