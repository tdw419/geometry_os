; DESCRIPTION: Draws a orange line from (76, 71) to (125, 81).
; PLAN: r0=76(x1), r1=71(y1), r2=125(x2), r3=81(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 71
LDI r2, 125
LDI r3, 81
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
