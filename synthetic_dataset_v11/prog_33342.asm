; DESCRIPTION: Draws a orange line from (223, 33) to (44, 132).
; PLAN: r0=223(x1), r1=33(y1), r2=44(x2), r3=132(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 33
LDI r2, 44
LDI r3, 132
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
