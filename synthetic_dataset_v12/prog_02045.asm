; DESCRIPTION: Draws a orange line from (34, 192) to (293, 240).
; PLAN: r0=34(x1), r1=192(y1), r2=293(x2), r3=240(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 192
LDI r2, 293
LDI r3, 240
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
