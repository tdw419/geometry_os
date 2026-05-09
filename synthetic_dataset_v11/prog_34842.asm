; DESCRIPTION: Draws a orange line from (235, 245) to (23, 32).
; PLAN: r0=235(x1), r1=245(y1), r2=23(x2), r3=32(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 245
LDI r2, 23
LDI r3, 32
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
