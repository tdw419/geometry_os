; DESCRIPTION: Draws a orange line from (228, 234) to (57, 122).
; PLAN: r0=228(x1), r1=234(y1), r2=57(x2), r3=122(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 234
LDI r2, 57
LDI r3, 122
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
