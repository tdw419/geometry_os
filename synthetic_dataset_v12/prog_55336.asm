; DESCRIPTION: Draws a orange line from (174, 50) to (50, 101).
; PLAN: r0=174(x1), r1=50(y1), r2=50(x2), r3=101(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 50
LDI r2, 50
LDI r3, 101
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
