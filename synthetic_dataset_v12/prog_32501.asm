; DESCRIPTION: Draws a orange line from (44, 137) to (372, 39).
; PLAN: r0=44(x1), r1=137(y1), r2=372(x2), r3=39(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 137
LDI r2, 372
LDI r3, 39
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
