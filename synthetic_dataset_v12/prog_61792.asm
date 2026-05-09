; DESCRIPTION: Draws a orange line from (268, 189) to (439, 79).
; PLAN: r0=268(x1), r1=189(y1), r2=439(x2), r3=79(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 189
LDI r2, 439
LDI r3, 79
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
