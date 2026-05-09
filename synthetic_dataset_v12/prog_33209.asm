; DESCRIPTION: Draws a orange line from (212, 126) to (125, 176).
; PLAN: r0=212(x1), r1=126(y1), r2=125(x2), r3=176(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 126
LDI r2, 125
LDI r3, 176
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
