; DESCRIPTION: Draws a orange line from (6, 245) to (1, 83).
; PLAN: r0=6(x1), r1=245(y1), r2=1(x2), r3=83(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 245
LDI r2, 1
LDI r3, 83
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
