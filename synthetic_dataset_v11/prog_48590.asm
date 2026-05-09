; DESCRIPTION: Draws a orange line from (130, 159) to (98, 250).
; PLAN: r0=130(x1), r1=159(y1), r2=98(x2), r3=250(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 159
LDI r2, 98
LDI r3, 250
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
