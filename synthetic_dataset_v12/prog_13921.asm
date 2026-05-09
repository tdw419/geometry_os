; DESCRIPTION: Draws a orange line from (83, 146) to (285, 101).
; PLAN: r0=83(x1), r1=146(y1), r2=285(x2), r3=101(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 146
LDI r2, 285
LDI r3, 101
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
