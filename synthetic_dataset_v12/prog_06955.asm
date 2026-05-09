; DESCRIPTION: Draws a orange line from (88, 186) to (380, 56).
; PLAN: r0=88(x1), r1=186(y1), r2=380(x2), r3=56(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 186
LDI r2, 380
LDI r3, 56
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
