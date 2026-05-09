; DESCRIPTION: Draws a orange line from (245, 122) to (122, 146).
; PLAN: r0=245(x1), r1=122(y1), r2=122(x2), r3=146(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 122
LDI r2, 122
LDI r3, 146
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
