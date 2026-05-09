; DESCRIPTION: Draws a orange line from (142, 243) to (499, 54).
; PLAN: r0=142(x1), r1=243(y1), r2=499(x2), r3=54(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 243
LDI r2, 499
LDI r3, 54
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
