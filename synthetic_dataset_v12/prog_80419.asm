; DESCRIPTION: Draws a orange line from (275, 169) to (268, 207).
; PLAN: r0=275(x1), r1=169(y1), r2=268(x2), r3=207(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 169
LDI r2, 268
LDI r3, 207
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
