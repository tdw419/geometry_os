; DESCRIPTION: Draws a orange line from (324, 251) to (285, 187).
; PLAN: r0=324(x1), r1=251(y1), r2=285(x2), r3=187(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 251
LDI r2, 285
LDI r3, 187
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
