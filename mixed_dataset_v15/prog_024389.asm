; DESCRIPTION: Draws a orange line from (39, 234) to (309, 81).
; PLAN: r0=39(x1), r1=234(y1), r2=309(x2), r3=81(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 234
LDI r2, 309
LDI r3, 81
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
