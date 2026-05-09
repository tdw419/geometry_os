; DESCRIPTION: Draws a orange line from (202, 56) to (125, 46).
; PLAN: r0=202(x1), r1=56(y1), r2=125(x2), r3=46(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 56
LDI r2, 125
LDI r3, 46
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
